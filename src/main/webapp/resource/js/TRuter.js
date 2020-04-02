/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// identity function for calling harmony imports with the correct context
/******/ 	__webpack_require__.i = function(value) { return value; };
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, {
/******/ 				configurable: false,
/******/ 				enumerable: true,
/******/ 				get: getter
/******/ 			});
/******/ 		}
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = 0);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ (function(module, exports) {

;(function (window, undefined) {

  var Route = function (path, name) {
    this.name = name;
    this.path = path;
    this.keys = [];
    this.fns = [];
    this.regex = service.pathToRegexp(this.path, this.keys, false, false);
  };

  Route.prototype.addHandler = function (fn) {
    this.fns.push(fn);
  };
  Route.prototype.fire = function (params, query) {
    this.query = query;
    this.params = params;
    for (var i = 0, l = this.fns.length; i < l; i++) {
      this.fns[i].apply(this);
    }
  };

  var service = {
    getHash: function () {
      return window.location.hash.substring(1);
    },
    getQuery: function () {
      var qstr = this.getHash().split('?')[1];
      var query = {};

      if (!qstr) return query;

      var block = (qstr[0] === '?' ? qstr.substr(1) : qstr).split('&');
      var key = '';
      for (var i = 0; i < block.length; i++) {
        key = block[i].split('=');
        query[decodeURIComponent(key[0])] = decodeURIComponent(key[1] || '');
      }
      return query;
    },
    pathToRegexp: function (path, keys, sensitive, strict) {
      if (path instanceof RegExp) return path;
      if (path instanceof Array) path = '(' + path.join('|') + ')';

      path = path.concat(strict ? '' : '/?').replace(/\/\(/g, '(?:/').replace(/\+/g, '__plus__').replace(/(\/)?(\.)?:(\w+)(?:(\(.*?\)))?(\?)?/g, function (_, slash, format, key, capture, optional) {
        keys.push({ name: key, optional: !!optional });
        slash = slash || '';
        return '' + (optional ? '' : slash) + '(?:' + (optional ? slash : '') + (format || '') + (capture || format && '([^/.]+?)' || '([^/]+?)') + ')' + (optional || '');
      }).replace(/([\/.])/g, '\\$1').replace(/__plus__/g, '(.+)').replace(/\*/g, '(.*)');

      return new RegExp('^' + path + '$', sensitive ? '' : 'i');
    },
    confToRouters: function (routerConfs) {
      var routers = [];
      var conf = null;
      var route = null;

      for (var i = 0, c = routerConfs.length; i < c; i++) {
        conf = routerConfs[i];

        route = new Route(conf.path, conf.name ? conf.name : conf.path);
        conf.handler && route.fns.push(conf.handler);

        routers.push(route);
      }

      return routers;
    },
    match: function (path, route, params) {
      var m = route.regex.exec(path);
      this.params = {};

      if (!m) return false;

      for (var i = 1, l = m.length; i < l; ++i) {
        var key = route.keys[i - 1];
        var val = 'string' === typeof m[i] ? decodeURIComponent(m[i]) : m[i];
        params[key.name] = val.replace(/\?\S+$/g, '');
      }

      return true;
    }
  };

  var Router = function (opts) {
    var s = service;
    var _this = this;

    this.mode = opts && opts.mode === 'history' && !!history.pushState ? 'history' : 'hash';
    this.root = opts && opts.root ? opts.root : '/';
    this.path = '';
    this.params = {};
    this.query = null;
    this.routes = opts && opts.routers ? s.confToRouters(opts.routers) : [];

    var hashChangeHandler = function (event) {
      event && event.preventDefault();

      _this.path = s.getHash();
      _this.query = s.getQuery();
      _this.params = {};
      var isMatch = false;

      if (!_this.path.length) {
        return window.location.hash = '/';
      }

      for (var i = 0, l = _this.routes.length; i < l; i++) {
        isMatch = s.match(_this.path, _this.routes[i], _this.params);

        if (isMatch) {
          return _this.routes[i].fire(_this.params, _this.query);
        };
      }
    };

    var listenHashChange = function () {
      hashChangeHandler();

      window.addEventListener('hashchange', hashChangeHandler);
    };
    var stopListenHashChange = function () {
      window.removeEventListener('hashchange', hashChangeHandler);
    };

    listenHashChange();
  };

  Router.prototype.push = function (where, params, query) {
    return window.location.hash = where;
  };

  window.TRouter = Router;
})(window);

/***/ })
/******/ ]);