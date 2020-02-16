/**
 * Ganji UI Library基础模块.
 * 使用全局变量GJ作为命名空间，用以包装最基础的应用.
 * @module ganji
 * @file js/util/ganji/ganji.js
 * @author lwg_8088@yahoo.com.cn
 * @version 2010-01-05
 */

var GJ = window.GJ || {},
    __GJ_CONFIG__ = window.__GJ_CONFIG__ || {};


(function (){
    var win = window, doc = win.document;
    if (win.__GJ_LOADED__){
        return;
    }
    win.__GJ_LOADED__ = true;

    /**
     * 配置变量.
     * 包括：
     * <ul>
     *     <li><strong>debug</strong> &nbsp; &nbsp; 是否调试。如果为true将使用未压缩、未合并的文件。</li>
     *     <li><strong>rootDir</strong> &nbsp; &nbsp; 根目录。当debug为true时是'src/'，否则为'public/'</li>
     *     <li><strong>addVersion</strong> &nbsp; &nbsp; 是否添加版本号。</li>
     *     <li><strong>useCombine</strong> &nbsp; &nbsp; 是否使用合并文件。</li>
     *     <li><strong>cookieDomain</strong> &nbsp; &nbsp; 保存cookie时的域，默认为'ganji.com'。</li>
     *     <li><strong>iframeProxyUrl</strong> &nbsp; &nbsp; 使用跨域iframe时的代理文件，默认为'/iframeproxy.html'。该文件要放在父窗口同域的根目录下。</li>
     *     <li><strong>defaultServer</strong> &nbsp; &nbsp; 静态文件服务默认域名。默认值'sat.ganji.com'</li>
     *     <li><strong>servers</strong> &nbsp; &nbsp; 静态文件服务其他域名。</li>
     *     <li><strong>fileVersions</strong> &nbsp; &nbsp; 文件版本号信息。</li>
     *     <li><strong>fileCombines</strong> &nbsp; &nbsp; 合并文件对应信息。</li>
     *     <li><strong>fileCodes</strong> &nbsp; &nbsp; 文件或文件组代号。</li>
     *
     * </ul>
     * @property GJ.config
     * @static
     * @type object
     */
    GJ.config = {
        debug : false,
        rootDir : '', //debug == true ? 'src/' : 'public/'
        addVersion : false,
        useCombine : false, //debug为true时只能是false
        cookieDomain : 'ganji.com',
        documentDomain : 'ganji.com',
        iframeProxyUrl : '/iframeproxy.html',  //跨域iframe调用时的代理文件，必须放在当前域下
        defaultServer : 'sta.ganji.com',
        servers : ["sta.ganjistatic1.com"],
        fileVersions : {},
        fileCombines : {},
        fileCodes    : {
            autocomplete   : 'js/util/autocomplete/autocomplete.js',
            jquery         : "js/util/jquery/jquery-1.7.2.js",
            jquery_ui       : "js/util/jquery/jquery.ui.js",
            util           : "js/util/ganji/util.cmb.js",
            json           : "js/util/json/json.js",
            log_tracker    : "js/util/log_tracker/log_tracker_simple.js",
            iframe         : ["jquery", "js/util/iframe/iframe.js"],
            panel          : ["js/util/panel/panel.css", "iframe", "js/util/dragdrop/dragdrop.js", "js/util/panel/panel.js"],
            flash          : ["jquery", "js/util/swfobject/swfobject-2.2.js", "js/util/swfobject/swfloader.js"],
            talk_to_parent : ["jquery", "js/util/window_name/window_name.js", "js/util/iframe/talk_to_parent.js"]
        },
        cdnFiles : {
            'tool/webim/js/webim.cmb.js': 1,
            'tool/webim_v2/js/webim.cmb.js': 1,
            'tool/webim_v3/js/webim.cmb.js': 1
        }
    };
    //数据类型判断
    (function(){
        var TYPES = {
            'undefined'         : 'undefined',
            'number'            : 'number',
            'boolean'           : 'boolean',
            'string'            : 'string',
            '[object Function]' : 'function',
            '[object RegExp]'   : 'regexp',
            '[object Array]'    : 'array',
            '[object Date]'     : 'date',
            '[object Error]'    : 'error'
        },
        L = {
            /**
             * 判断一个变量是不是数组.
             * @method GJ.isArray
             * @static
             * @param o 用来测试的变量
             * @return {boolean} 如果是数组返回true
             */
            isArray : function(o){
                return L.typeOf(o) === 'array';
            },

            /**
             * 判断一个变量是不是布尔值.
             * @method GJ.isBoolean
             * @static
             * @param o 用来测试的变量
             * @return {boolean} 如果是布尔值返回true
             */
            isBoolean : function(o){
                return typeof o === 'boolean';
            },

            /**
             * 判断一个变量是不是函数.
             * @method GJ.isFunction
             * @static
             * @param o 用来测试的变量
             * @return {boolean} 如果是函数返回true
             */
            isFunction : function(o){
                return L.typeOf(o) === 'function';
            },

            /**
             * 判断一个变量是不是日期.
             * @method GJ.isDate
             * @static
             * @param o 用来测试的变量
             * @return {boolean} 如果是日期返回true
             */
            isDate : function(o){
                return L.typeOf(o) === 'date';
            },

            /**
             * 判断一个变量是不是null.
             * @method GJ.isNull
             * @static
             * @param o 用来测试的变量
             * @return {boolean} 如果是null返回true
             */
            isNull : function(o){
                return o === null;
            },

            /**
             * 判断一个变量是不是数字.
             * @method GJ.isNumber
             * @static
             * @param o 用来测试的变量
             * @return {boolean} 如果是数字返回true
             */
            isNumber : function(o){
                return typeof o === 'number' && isFinite(o);
            },

            /**
             * 判断一个变量是不是对象.
             * @method GJ.isObject
             * @static
             * @param o 用来测试的变量
             * @param failfn {boolean} 如果设为true，则函数不算作对象。默认值：false
             * @return {boolean} 如果是对象返回true
             */
            isObject : function(o, failfn){
                return (o && (typeof o === 'object' || (!failfn && L.isFunction(o)))) || false;
            },

            /**
             * 判断一个变量是不是字符串.
             * @method GJ.isString
             * @static
             * @param o 用来测试的变量
             * @return {boolean} 如果是字符串返回true
             */
            isString : function(o){
                return typeof o === 'string';
            },

            /**
             * 判断一个变量是不是未定义。
             * 只能判断一个对象的元素，不能是单独的变量，如:
             * if (GJ.isUndefined(window.name)){
             *     ...
             * }
             * @method GJ.isUndefined
             * @static
             * @param o 用来测试的变量
             * @return {boolean} 如果是未定义返回true
             */
            isUndefined : function(o){
                return typeof o === 'undefined';
            },

            /**
             * 判断一个变量是否不是null/undefined/NaN.
             * @method GJ.isValue
             * @static
             * @param o 用来测试的变量
             * @return {boolean} 如果不是null/undefined/NaN返回true
             */
            isValue : function(o){
                var t = L.typeOf(o);
                switch (t){
                    case 'number':
                        return isFinite(o);
                    case 'null':
                    case 'undefined':
                        return false;
                    default:
                        return !!(t);
                }
            },

            /**
             * 检测一个变量的类型.
             * @method GJ.typeOf
             * @static
             * @param o 用来检测的变量
             * @return {string} 返回变量的类型
             */
            typeOf : function (o){
                return  TYPES[typeof o] || TYPES[Object.prototype.toString.call(o)] || (o ? 'object' : 'null');
            }
        };

        /**
         * 合并两个对象。
         * 将参数supplies对象的元素合并到参数receive对象中
         * @method GJ.mix
         * @static
         * @param {object} receive 源对象
         * @param {object} supplies 用来合并到receive中的对象
         * @param {boolean} overwritten 如果设为true，supplies中的元素将替换receive中的同名元素，默认值为false
         * @param {boolean} recursion 是否递归，默认值为false
         * @return {object} 返回receive对象的引用
         */
        GJ.mix = function (r, s, ov, rec)
        {
            if (L.isObject(r) && L.isObject(s)){
                for (var i in s){
                    if (s.hasOwnProperty(i)) {
                        if (!(i in r)) {
                            r[i] = s[i];
                        } else if (ov) {
                            if (rec && L.isObject(r[i], true) && L.isObject(s[i], true)) {
                                GJ.mix(r[i], s[i], ov, rec);
                            } else {
                                r[i] = s[i];
                            }
                        }
                    }
                }
            }
            return r;
        };

        GJ.mix(GJ, L, true);
    })();

    /**
     * 遍历对象或数组，对每个元素应用回调函数。
     * @method GJ.each
     * @static
     * @param {object|array} o 要遍历的对象或数组
     * @param {Function} callback 回调函数。将为此函数设置两个参数：val元素值，key元素下标。
     * 在函数内部使用return false可以终止遁环
     */
    GJ.each = function(o, cb){
        if (GJ.isFunction(cb)){
            var i, n, r;
            if (GJ.isArray(o)){
                for (i=0, n=o.length; i<n; i++){
                    r = cb(o[i], i);
                    if (r === false) break;
                }
            }
            else if (GJ.isObject(o)){
                for (i in o){
                    if (o.hasOwnProperty(i)){
                        r = cb(o[i], i);
                        if (r === false) break;
                    }
                }
            }
        }
    };
    GJ.map = function (arr, cb) {
        var ret = [];
        GJ.each(arr, function (v, i) {
            ret.push(cb(v, i));
        });
        return ret;
    }
    GJ.inArray = function (v, arr) {
        var index = -1;
        GJ.each(arr, function (a, i) {
            if (a === v) {
                index = i;
                return false;
            }
        });
        return index;
    }

    /**
     * 设置配置变量。
     * 有两种使用方法：GJ.setConfig(config)和GJ.setConfig(key, val)
     * @method GJ.setConfig
     * @static
     * @param {object} config 配置数据对象
     */
    GJ.setConfig = function(config)
    {
        var a=arguments, cfg=GJ.config;
        if (a.length == 2){
            var o = {};
            o[a[0]] = a[1];
            GJ.setConfig(o);
        }
        else {
            GJ.each(config, function(v, k){
                if (GJ.isObject(cfg[k])){
                    GJ.mix(cfg[k], v, true);
                }
                else cfg[k] = v;
            });
        }

        cfg.rootDir = cfg.debug ? 'src/' : 'public/';
        if (cfg.debug) cfg.useCombine = false;
    };

    (function (){
        if (!window.__GJ_PACK_CONFIG__) return ;

        var ret = [], o = window.__GJ_PACK_CONFIG__,
            getVal = function (val){
                if (GJ.isNumber(val)) {
                    return ret[val];
                } else {
                    var r = [];
                    GJ.each(val, function (v, k){
                        r.push(ret[val[k]]);
                    });
                    return r;
                }
            },
            parseIt = function (val, type){
                var r = {};
                GJ.each(val, function (v, k){
                    if (type == 1) {
                        r[ret[k]] = v;
                    } else if (type == 2) {
                        r[ret[k]] = getVal(v);
                    } else if (type == 3) {
                        r[k] = getVal(v);
                    }
                });
                return r;
            };

        GJ.each(o.words, function (v, k){
            var s = v.split('|');
            ret[k] = s[1] ? ret[s[0]] + s[1] : s[0];
        });
        o.fileVersions = parseIt(o.fileVersions, 1);
        o.fileCombines = parseIt(o.fileCombines, 2);
        o.fileCodes    = parseIt(o.fileCodes, 3);
        delete o.words;

        GJ.setConfig(o);
    })();

    GJ.setConfig(__GJ_CONFIG__);

    /**
     * 取得从from(含from)到to(含to)的整数随机数。
     * @method GJ.rand
     * @static
     * @param {int} from 起始数字
     * @param {int} to 结束数字
     * @return {int} 返回生成的随机数
     */
    GJ.rand = function (from, to)
    {
        return parseInt(Math.random() * (to - from + 1) + from);
    };

    (function(){
        var count = 0;
        /**
         * 取得一个随机的sta*.ganji.com。
         * @method GJ.getRandServer
         * @static
         * @return {string} 返回ganji_sta的域名
         */
        GJ.getRandServer = function()
        {
            var servers = GJ.config.servers;
            return servers[count++ % servers.length];
        };
    })();

    /**
     * 设置命名空间。
     * 可以同时设置多个命名空间，每个命名空间可以是多级。
     * @method GJ.namespace
     * @static
     * @param {string} o* 一个或多个参数
     * @example GJ.namespace('util', 'widget.image');
     */
    GJ.namespace = function(){
        var a=arguments, o=null, i, n, j, k, d;
        for (i=0, n=a.length; i<n; i++){
            d=a[i].split("."); o=GJ;

            for (j=(d[0] == "GJ") ? 1 : 0, k=d.length; j<k; j++){
                o[d[j]]=o[d[j]] || {};
                o=o[d[j]];
            }
        }
        return o;
    };
    GJ.namespace('util', 'apps', 'widget', 'common');

    (function(){
        var _copyFunctions = function(ret, o){
                GJ.each(o, function(v, k){
                    if (GJ.isFunction(v)) {
                        ret[k] = function(_v){
                            return function(){
                                return _v.apply(o, arguments);
                            }
                        }(v);
                    }
                });
            }
            ,_fromObj = {'**SYS_FROM_INSIDE**' : true};

        GJ.f = function(params, cb){
            if (arguments.length === 1) {
                cb = params;
                params = {};
            }

            var __const     = params.__const   || {}
                ,__extends  = params.__extends || null;

            function func(_ret, _protected, _from) {
                var isEntry  = !_from || !_from['**SYS_FROM_INSIDE**']
                    ,ret     = isEntry ? {} : _ret
                    ,_protec = isEntry ? {} : _protected
                    ,parent  = null;

                if (__extends) {
                    if (GJ.isArray(__extends)) {
                        for (var i=0, n=__extends.length; i<n; i++) {
                            if (GJ.isFunction(__extends[i])) {
                                __extends[i](ret, _protec, _fromObj);
                            }
                        }
                    } else if (GJ.isFunction(__extends)) {
                        __extends(ret, _protec, _fromObj);
                    }

                    parent = {};
                    _copyFunctions(parent, ret);
                }

                if (GJ.isFunction(cb)) {
                    var conf = cb.apply(ret, [_protec, parent]);
                    if (GJ.isObject(conf)) {
                        GJ.mix(ret, conf, true);
                    }
                }

                if (isEntry) {
                    if (ret.__construct) {
                        ret.__construct.apply(ret, arguments);
                        delete ret.__construct;
                    }
                }

                return ret;
            }

            if (params.__static) {
                GJ.mix(func, params.__static, true);
            }

            func.getConst = function(k) {
                return __const[k] || null;
            }

            return func;
        };
    })();

    /**
     * 实现类的继承。
     * @method GJ.extend
     * @static
     * @param {class} r 当前类
     * @param {class} s 父类
     * @param {class} px 要添加的成员变量
     * @param {class} sx 要添加的静态变量
     */
    GJ.extend = function(r, s, px, sx)
    {
        if (!s||!r){
        }

        var sp=s.prototype, F=function(){};
        F.prototype = sp;
        var rp = new F();

        r.prototype    = rp;
        rp.constructor = r;
        r.superclass   = sp;

        if (s != Object && sp.constructor == Object.prototype.constructor){
            sp.constructor = s;
        }

        if (px){
            GJ.mix(rp, px, true);
        }

        if (sx){
            GJ.mix(r, sx, true);
        }
    };

    /**
     * 创建一个类。
     * 有三种用法：<br />
     * 1、GJ.createClass(parentClass, prototypeObject, staticObject);<br />
     * 2、GJ.createClass(prototypeObject, staticObject);<br />
     * 3、GJ.createClass(prototypeObject);<br />
     * 参数parentClass表示父类，prototypeObject是成员变量，staticObject是静态变量<br />
     * 参数prototypeObject中应有下标为init的函数作为构造函数
     *
     * @method GJ.createClass
     * @static
     * @param {object} args* 父类、成员变量、静态变量
     * @return {class} 返回创建的类
     * @example
     * <script type="text/javascript">
     * GJ.createClass({
     *     init : function(){},
     *     ...
     * });
     * </script>
     */
    GJ.createClass = function(){
        var a = arguments, l = a.length;

        function F(){
            this.__inited__ = false;

            if (F.superclass){
                F.superclass.constructor.apply(this, arguments);
            }

            if (!this.__inited__ && this.init && GJ.isFunction(this.init)){
                var ret = this.init.apply(this, arguments);
                this.__inited__ = true;
                if (GJ.isObject(ret)) return ret;
            }
        }

        if (GJ.isFunction(a[0])){
            GJ.extend(F, a[0], a[1] || null, a[2] || null);
        }
        else {
            if (a[0]){
                F.prototype = a[0];
            }
            if (a[1]){
                GJ.mix(F, a[1], true);
            }
        }

        return F;
    };

    (function(){
        var guid_counter = 0;
        /**
         * 取得一个不重复的随机字符串
         * @method GJ.guid
         * @static
         * @param {string} pre 前缀 默认为"guid_"
         * @return {string}
         */
        GJ.guid = function(pre)
        {
            var r = new Date().getTime() + '' + Math.random();
            return (pre ? pre : 'guid_') + guid_counter++ + '_' + r.replace(/\./g, '_');
        }

        var cacheData = {};
        /**
         * 根据id号取得缓存对象
         * @method GJ.getCache
         * @static
         * @param {string} id 关联缓存对象的id号
         * @return {object}
         */
        GJ.getCache = function (id)
        {
            return !GJ.isUndefined(cacheData[id]) ? cacheData[id] : null;
        };
        /**
         * 将一个局部变量存入缓存，以便通过GJ.getCache(id)获取
         * 有两种用法：<br />
         * 1、直接将变量存入缓存，并返回id号。如：var id = GJ.setCache(val);<br />
         * 2、将变量存入缓存的同时，指定id号。如：GJ.setCache(id, val);
         * @method GJ.setCache
         * @static
         * @param {string} id 关联缓存对象的id号
         * @param {object} data 要存储的变量
         * @return {string} 返回关联缓存对象的id号
         */
        GJ.setCache = function (id, data)
        {
            if (arguments.length == 1){
                data = id;
                id = GJ.guid();
            }
            cacheData[id] = data;
            return id;
        };
        /**
         * 根据id号移除缓存对象
         * @method GJ.removeCache
         * @static
         * @param {string} id 关联缓存对象的id号
         * @return {void}
         */
        GJ.removeCache = function (id)
        {
            if (!GJ.isUndefined(cacheData[id])){
                delete cacheData[id];
            }
        };
        /**
         * 清空缓存数据
         * @method GJ.clearCache
         * @static
         * @return {void}
         */
        GJ.clearCache = function ()
        {
            cacheData = {};
        };
    })();

    /**
     * 根据cookie名称取得cookie值
     * @method GJ.getCookie
     * @static
     * @param {string} name cookie名称
     * @return {string}
     */
    GJ.getCookie = function(name)
    {
        var doc=document, val = null, regVal;

        if (doc.cookie){
            regVal = doc.cookie.match(new RegExp("(^| )"+name+"=([^;]*)(;|$)"));
            if(regVal != null){
                val = decodeURIComponent(regVal[2]);
            }
        }

        return val;
    };

    /**
     * 设置cookie
     * @method GJ.setCookie
     * @static
     * @param {string} name cookie名称
     * @param {string} value cookie值
     * @param {int} expire 过期时间(秒)，默认为零
     * @param {string} path 路径，默认为空
     * @param {string} domain 域
     * @return {boolean} 设置成功返回true
     */
    GJ.setCookie = function(name, value, expire, path, domain, s)
    {
        if (GJ.isUndefined(document.cookie)){
            return false;
        }

        expire = !GJ.isNumber(expire) ? 0 : parseInt(expire);
        if (expire < 0){
            value = '';
        }

        var dt = new Date();
        dt.setTime(dt.getTime() + 1000 * expire);

        document.cookie = name + "=" + encodeURIComponent(value) +
            ((expire) ? "; expires=" + dt.toGMTString() : "") +
            "; path=" + (path || '/') +
            "; domain=" + (domain || GJ.config.cookieDomain) +
            ((s) ? "; secure" : "");

        return true;
    };

    /**
     * 移除cookie
     * @method GJ.removeCookie
     * @static
     * @param {string} name cookie名称
     * @param {string} path 路径，默认为空
     * @param {string} domain 域
     * @return {boolean} 移除成功返回true
     */
    GJ.removeCookie = function(name, path, domain)
    {
        return GJ.setCookie(name, '', -1, path, domain);
    };

    /**
     * 抛出错误提示
     * @method GJ.error
     * @static
     * @param {string} msg 提示信息
     * @return {void}
     */
    GJ.error = function(msg)
    {
        throw new Error(msg);
    };

    /**
     * 通过firebug显示调试信息
     * @method GJ.log
     * @static
     * @param {object} data 要调试的数据
     * @return {void}
     */
    GJ.log = function(data)
    {
        //if (GJ.isFunction(GJ.jsonEncode)){
        //    data = GJ.jsonEncode(data, '    ');
        //}

        if (typeof console != 'undefined' && console.log){
            console.log(data);
        }
        else if (typeof opera != 'undefined'){
            opera.postError(data);
        }
    };

    /**
     * 延迟定时执行回调函数
     * 是对setTimeout()和setInterval()的包装
     * @method GJ.later
     * @static
     * @param {Function} fn 回调函数
     * @param {int} when 延迟毫秒数
     * @param {boolean} loop 是否循环。默认为false
     * @return {object} 返回一个对象，通过此对象的cancel()方法，可以取消定时器
     * @example
     * <script type="text/javascript">
     * var i = 0, timer;
     * timer = GJ.later(function(){
     *     alert(i);
     *     i++;
     *     if (i == 10) timer.cancel();
     * }, 2000, true);
     * </script>
     */
    GJ.later = function(fn, when, loop)
    {
        when = when || 0;
        var r = null,
            run = function(){
                r = r || (loop) ? setInterval(fn, when) : setTimeout(fn, when);
            };
        run();

        return {
            run : run,
            cancel: function(){
                if (r){
                    if (loop){
                        clearInterval(r);
                    } else {
                        clearTimeout(r);
                    }
                    r = null;
                }
            }
        };
    };

    /**
     * 等候条件为真是执行回调函数
     * @method GJ.waiter
     * @static
     * @param {Function} check 用来检测是否为真的函数或是否可用的变量
     * @param {Function} callback 回调函数
     * @param {int} speed 间隔毫秒数。默认为100。每间隔speed毫秒检查一次
     * @param {int} expire 过期时间(秒)。默认为10秒
     * @return {void}
     * @example
     * <script type="text/javascript">
     * GJ.waiter(function(){
     *     return !!window.jQuery;
     * }, function(){
     *     $('#id').html('Hello World!');
     * });
     *
     * var check = function(){
     *     return !GJ.isUndefined(window.jQuery);
     * };
     * GJ.waiter(check, function(){
     *     $('#id').html('Hello World!');
     * });
     * </script>
     */
    GJ.waiter = function(check, callback, speed, expire)
    {
        if (!GJ.isFunction(check) || !GJ.isFunction(callback)){
            return ;
        }

        var _speed = speed || 100, _time = 0, expire = (expire || 10)*1000,
            _run = function(ck, cb){
                if (ck()){
                    cb();
                    return ;
                }
                _time += _speed;
                if (!expire || _time < expire){
                    GJ.later(function(){
                        _run(ck, cb);
                    }, _speed);
                }
            };

        _run(check, callback);
    };

    /**
     * 为元素绑定事件
     * @event GJ.addEvent
     * @static
     * @param {object} el 要绑定事件的网页元素
     * @param {string} type 事件类型名称，如click
     * @param {Function} func 要绑定的事件函数
     * @return {void}
     */
    GJ.addEvent = function(el, type, fn){
        if (el.addEventListener){
            el.addEventListener(type, fn, false);
        }
        else if (el.attachEvent){
            el.attachEvent("on" + type, fn);
        }
    };

    /**
     * 为元素移除事件绑定
     * @event GJ.removeEvent
     * @static
     * @param {object} el 要移除事件绑定的网页元素
     * @param {string} type 事件类型名称，如click
     * @param {Function} func 要移除的事件函数
     * @return {void}
     */
    GJ.removeEvent = function(el, type, fn){
        if (el.removeEventListener){
            el.removeEventListener(type, fn, false);
        }
        else if (el.detachEvent){
            el.detachEvent("on" + type, fn);
        }
    };


    // 错误处理
    (function () {
        GJ.errorStack = [];
        var willSend = !GJ.config.debug && parseInt(Math.random() * 51) === 1;
        var flushedLen = 0;

        GJ.wrap = function (wrapper, fn) {
            if (typeof fn === 'function' && /^function/.test(fn.toString())) {
                return wrapper(fn);
            }

            return fn;
        }

        GJ.guard = function (target, prefix) {
            return function () {
                try {
                    return target.apply(this, arguments);
                } catch (ex) {
                    try {
                        GJ.errorStack.push({
                            'type': prefix || 'GJ_GUARD',
                            'message': ex.message || ex.toString(),
                            'stack': ex.stack,
                            'fn': target.toString().substr(0, 200)
                        });
                    } catch (exx) {}

                    throw ex;
                }
            }
        }

        GJ.goTry = function (prefix, fn) {
            return GJ.guard(fn, prefix);
        }

        var timer;
        GJ.errorManager = {
            send: function (msg, loc, type) {
                GJ.errorStack.push({
                    type: type,
                    message: msg,
                    loc: loc
                });
                clearTimeout(timer);
                timer = setTimeout(sendLog, 3000);
            }
        };

        function sendLog() {
            if (!willSend) {
                return;
            }
            if (flushedLen === GJ.errorStack.length) {
                return;
            }

            GJ.use('jquery', function ($) {
                flushedLen = GJ.errorStack.length;
                $.ajax({
                    url: '/jslogs.php',
                    type: 'POST',
                    data: {
                        'data': GJ.jsonEncode({
                            'stack': GJ.errorStack,
                            'url': window.location.href,
                            'referrer': document.referrer
                        })
                    },
                    error: function () {
                        GJ.use('log_tracker', function () {
                            GJ.LogTracker.trackEvent("javascript@atype=view"+
                                "@LOC="+encodeURIComponent(window.location.href)+
                                "@ERR="+encodeURIComponent("jslogs interface is not reachable!")+
                                "@TYPE="+encodeURIComponent("JSLOG_NOT_REACHABLE")
                            );
                        });
                    }
                });
            });
        }
    })();

    +function () {
        GJ.Deferred = function (){
            // state in ['pending', 'done', 'fail']
            var state = "pending";
            var callbacks = {
                    'done':     [],
                    'fail':     [],
                    'always':   []
                };
            // `args` will be the `arguments` of callbacks
            var args = [];

            function dispatch ( status, cb ) {
                if (typeof cb === 'function') {
                    if ( state === status || (status === 'always' && state !== 'pending') ) {
                        setTimeout( function () {
                            cb.apply( {}, args );
                        }, 0 );
                    } else {
                        callbacks[status].push( cb );
                    }
                } else if ( state === 'pending' ) { // only 'pending' can change to 'done' or 'fail'
                    state = status;
                    var cbs = callbacks[status];
                    var always = callbacks['always'];

                    while( (cb = cbs.shift()) || (cb = always.shift()) ) {
                        setTimeout( (function ( fn ) {
                            return function () {
                                fn.apply( {}, args );
                            }
                        })( cb ), 0 );
                    }
                }
            };

            return {
                state: function () {
                    return state;
                },
                done: function (cb) {
                    if (typeof cb === 'function') {
                        dispatch('done', cb);
                    } else {
                        args = [].slice.call(arguments);
                        dispatch('done');
                    }
                    return this;
                },
                fail: function (cb) {
                    if (typeof cb === 'function') {
                        dispatch('fail', cb);
                    } else {
                        args = [].slice.call(arguments);
                        dispatch('fail');
                    }
                    return this;
                },
                always: function (cb) {
                    if (typeof cb === 'function') {
                        dispatch('always', cb);
                    }
                    return this;
                },
                promise: function () {
                    return {
                        done: function (cb) {
                            if (typeof cb === 'function') {
                                dispatch('done', cb);
                            }
                            return this;
                        }
                        ,fail: function (cb) {
                            if (typeof cb === 'function') {
                                dispatch('fail', cb);
                            }
                            return this;
                        }
                        ,always: function (cb) {
                            if (typeof cb === 'function') {
                                dispatch('always', cb);
                            }
                            return this;
                        }
                        ,state: function () {
                            return state;
                        }
                    }
                }
            };
        };

        GJ.when = function (){
            var ret     = GJ.Deferred(),
                defers  = [].slice.call(arguments),
                len     = defers.length,
                count   = 0;
            if (!len) {
                return ret.done().promise();
            }
            for ( var i = defers.length - 1; i >= 0; i-- ) {
                defers[i].fail(function () {
                    ret.fail();
                }).done(function () {
                    if ( ++count === len ) {
                        ret.done();
                    }
                });
            };
            return ret.promise();
        }
    }();
    // GJ.Module
    +function () {
        var headNode = document.getElementsByTagName("head")[0], cfg=GJ.config;
        var versions = cfg.fileVersions, alias=cfg.fileCodes, combines = cfg.fileCombines;
        var debug = GJ.config.debug ? true : false;
        var defers = {};
        var eventList = [];
        var startTime = +new Date;

        GJ.defers = defers;
        GJ.eventList = eventList;
        var STATUS = {
            'ERROR'     : -2,
            'FAILED'    : -1,
            'FETCHING'  : 1,   // The module file is fetching now.
            'FETCHED'   : 2,   // The module file has been fetched.
            'SAVED'     : 3,   // The module info has been saved.
            'READY'     : 4,   // The module is waiting for dependencies
            'COMPILING' : 5,   // The module is in compiling now.
            'PAUSE'     : 6,
            'COMPILED'  : 7    // The module is compiled and module.exports is available.
        }
        var require = function (uri) {
            uri = require.resolve(uri)[0];
            if (require.cache[uri] && require.cache[uri].status === STATUS.COMPILED) {
                return require.cache[uri].exports;
            } else {
                throw new Error(uri+'尚未加载');
            }
        }
        require.resolve = function (uri) { // 处理别名，返回为一个uri数组
            var ret = [];
            if (alias[uri]) {
                if (typeof alias[uri] === 'string') {
                    alias[uri] = [alias[uri]];
                }
                GJ.each(alias[uri], function (u) {
                    GJ.each(require.resolve(u), function (i) {
                        ret.push(i);
                    });
                });
            } else {
                ret.push(uri);
            }
            return ret;
        }
        require.cache = {};

        GJ.Module = {
            STATUS: STATUS,
            cache: require.cache,
            fileLoaders: {
                ".js": jsLoader,
                ".css": cssLoader
            },
            find: function (uri) {
                return require.cache[require.resolve(uri)];
            }
        }

        var getAbsoluteUrl = function(uri, server){
            var _uri = uri.toLowerCase();
            if(_uri.indexOf('http:') === 0 || _uri.indexOf('https:') === 0){
                return uri;
            }

            if (uri.indexOf('./') === 0 || uri.indexOf('../') === 0) {
                var loc = window.location,
                    port = (loc.port ? ':' + loc.port : '');
                return loc.protocol + '//' + loc.host + port + '/' + uri;
            } else {
                if (!server) {
                    if (cfg.cdnFiles[uri]) {
                        server = 'http://stacdn201.ganjistatic1.com';
                    } else {
                        server = GJ.config.defaultServer;
                    }
                }

                if (server.indexOf('http') !== 0) {
                    server = 'http://' + server;
                }

                // 如果开头有http，说明是一个完整的绝对地址。用当前URL协议替换server的协议
                if (server.indexOf('http') === 0) {
                    server = server.replace('http:',window.location.protocol);
                };


                var version = getVersion(uri);

                return server + '/' + cfg.rootDir
                + uri.replace(/(\.(js|css|html?|swf|gif|png|jpe?g))$/i, ".__" + getVersion(uri) + "__$1");
            }
        };

        var now = new Date();
        var defaultVersionTime = new Date(now.getFullYear(), now.getMonth(), now.getDate(), 18, 21, 00).getTime();

        var getVersion = function(uri){
            var v = new Date().getTime();
            var version;
            if (cfg.fileVersions) {
                version = cfg.fileVersions[uri];
                if(!version) {
                    if(GJ.config.defaultVersion) {
                        version = GJ.config.defaultVersion;
                    } else {
                        if (v < defaultVersionTime) {
                            v = defaultVersionTime - 24 * 3600 * 1000;
                        } else {
                            v = defaultVersionTime;
                        }
                        version = parseInt(v/1000, 10);
                    }
                }
            }
            return version;
        };

        /**
         * 取得一个格式化的url
         * 根据一个相对url，取得添加了http://sta*.ganji.com域名与版本号的完整url
         * @method GJ.getFormatUrl
         * @static
         * @param {string} url 文件url，相对http://sta*.ganji.com/src指定
         * @param {string} hostname 域名。默认为空。如果不为空将使用此域名，否则随机生成sta*.ganji.com域名
         * @return {string}
         * @example
         * <script type="text/javascript">
         * var url = GJ.getFormatUrl('js/util/json/json.js');
         * //url的值：http://sta1.ganji.com/src/js/util/json/json.__2343654234__.js
         * var url = GJ.getFormatUrl('js/util/json/json.js', 'sta.ganji.com');
         * //url的值：http://sta.ganji.com/src/js/util/json/json.__2343654234__.js
         * </script>
         */
        GJ.getFormatUrl = function(url, hostname){
            var urls = require.resolve(url), ret=[];
            var ret = GJ.map(urls, function(url){
                return getAbsoluteUrl(url, hostname);
            });
            return ret.length === 1 ? ret[0] : ret;
        };

        /**
         * 同步载入一个或多个js、css文件
         * 采用document.write()方式载入。<br />代码要用script标签包装。<br />由于同步载入影响性能，一般不要使用
         * @method GJ.require
         * @static
         * @param {string|array} urls 可以是js、css文件url，也可以是一组文件的代号，多个可用逗号分隔，也可用数组。相对http://sta*.ganji.com/src指定
         * @return {void}
         * @example
         * <script type="text/javascript">
         * GJ.require('jquery,js/util/json/json.js');
         * GJ.require(['js/util/panel/panel.js', 'js/util/panel/panel.css']);
         * </script>
         */
        GJ.require = function(uris, onError){
            var doc=document;
            var deps = resolveDeps(uris);
            var files = [];
            if (debug) {
                GJ.each(deps, function (dep) {
                    if (combines[dep.uri]) {
                        GJ.each(resolveDeps(combines[dep.uri]), function (d) {
                            files.push(d);
                        });
                    } else {
                        files.push(dep);
                    }
                });
            } else {
                files = deps;
            }
            GJ.each(files, function(dep){
                var uri = dep.uri;
                dep.status = STATUS.FETCHING;
                if (GJ.isFunction(onError)) {
                    defers[dep.id].fail(onError);
                }
                if (/\.css$/i.test(uri)){
                    doc.write(unescape("%3Clink href='"+getAbsoluteUrl(uri)+"' type='text/css' rel='stylesheet' /%3E"));
                }
                else {
                    doc.write(unescape("%3Cscript src='"+getAbsoluteUrl(uri)+"' type='text/javascript'%3E%3C/script%3E"));
                }
            });
        };

        /**
         * 异步载入一个或多个js、css文件
         * @method GJ.use
         * @static
         * @param {string|array} urls 可以是js、css文件url，也可以是一组文件的代号，多个可用逗号分隔，也可用数组。相对http://sta*.ganji.com/src指定
         * @param {Function} onLoad 全部载入完成时的回调函数
         * @param {Function} onError 载入出错时的回调函数
         * @return {void}
         * @example
         * <script type="text/javascript">
         * GJ.use('jquery,js/util/json/json.js', function(){
         *     $('#id').html(GJ.jsonEncode({msg:'Hello World!'}));
         * });
         * </script>
         */
        GJ.use = function(dependencies, func, onError){
            var id = GJ.guid();
            dependencies = resolveDeps(dependencies);
            var module = require.cache[id] = {
                id              : id
                ,dependencies   : dependencies
                ,status         : STATUS.SAVED
                ,factory         : func
                ,onError        : onError
            }
            var defer = defers[id] = GJ.Deferred();
            if (GJ.isFunction(onError)) {
                defer.fail(onError);
            };
            eventList.push([-(startTime - new Date), 'use', id]);
            moduleWait(id);
        };
        require.async = GJ.use;

        /**
         * 通知文件已载入
         * 作为js文件编写模板
         * @method GJ.add
         * @static
         * @param {string} url 当前文件的url，相对http://sta*.ganji.com/src指定
         * @param {string|array} needUrls 所依赖的其它文件。可以是js、css文件url，也可以是一组文件的代号，多个可用逗号分隔，也可用数组。相对http://sta*.ganji.com/src指定
         * @param {Function} func 在所依赖的文件都载入后的回调函数。主体代码置于此函数中
         * @return {void}
         */
        GJ.add = function(uri, dependencies, func, onError){
            var module = require.cache[uri], defer = defers[uri];
            if (module && module.status >= STATUS.SAVED) { // 阻止重复载入模块
                GJ.log(uri+' 重复载入['+module.status+']');
                return;
            }

            if (GJ.isFunction(dependencies)) {
                onError = func;
                func = dependencies;
                dependencies = [];
            }

            dependencies = resolveDeps(dependencies);
            if (module) {
                module.dependencies = dependencies;
                module.status       = STATUS.SAVED;
                module.factory      = func;
                module.onError      = onError;
                module.exports      = {};
            } else {
                require.cache[uri] = {
                    id              : uri
                    ,uri            : uri
                    ,dependencies   : dependencies
                    ,status         : STATUS.SAVED
                    ,factory        : func
                    ,onError        : onError
                    ,exports        : {}
                }
                module = require.cache[uri];
            }
            if (!defer) {
                defer = defers[uri] = GJ.Deferred();
            }
            eventList.push([-(startTime - new Date), 'add', uri]);
            if (GJ.isFunction(onError)) {
                defer.fail(onError);
            };
            moduleWait(uri);
        };
        function moduleWait (uri) {
            var module = require.cache[uri];
            var toFetchDeps = [];
            eventList.push([-(startTime - new Date), 'waiting', uri]);
            GJ.each(module.dependencies, function (dep) {
                if (dep.status < STATUS.FETCHING) { // before fetching
                    toFetchDeps.push(dep.uri);
                }
            });
            GJ.each(toFetchDeps, function (uri) {
                loadFile(uri);
            });
            var depDefers = GJ.map(module.dependencies, function (dep) {
                return defers[dep.id];
            });
            GJ.when.apply({}, depDefers)
                .done(function () {
                    moduleReady(uri);
                });
        }
        function moduleReady (uri) {
            eventList.push([-(startTime - new Date), 'ready', uri]);
            var module = require.cache[uri], defer = defers[uri];
            module.exports = {};
            module.status = STATUS.READY;
            if (GJ.isFunction(module.factory)) {
                module.status = STATUS.COMPILING;
                try {
                    if (module.uri) { // GJ.add  =>  function (require, exports, module)
                        module.pause = function () {
                            module.status = STATUS.PAUSE;
                        }
                        module.resume = function () {
                            // keep clean
                            delete module.pause;
                            delete module.resume;

                            module.status = STATUS.COMPILED;
                            defer.done();
                        }
                        var ret = module.factory.call(window, require, module.exports, module);
                        if (ret) {
                            module.exports = ret;
                        }
                    } else { // GJ.use  =>  function (d1, d2, d3, d4)
                        var depExports = GJ.map(module.dependencies, function (dep) {
                            return dep.exports;
                        });
                        module.factory.apply(window, depExports);
                    }
                } catch (ex) {
                    // TODO: 更具体的调试信息，包括模块的调用栈(module.parent);
                    GJ.log('MOD: '+uri);
                    GJ.log('DEP: '+GJ.jsonEncode(GJ.map(module.dependencies, function (dep) {
                        return dep.id;
                    })));
                    GJ.log('ERR: '+ex.message);
                    module.status = STATUS.ERROR;
                    defer.fail();
                    var fnStr = module.factory.toString();
                    fnStr = fnStr.length > 150 ? fnStr.substr(0, 150) : fnStr;

                    GJ.errorStack.push({
                        'type': 'GJ_MODULE_CALLBACK_ERROR',
                        'message': ex.message,
                        'uri': uri,
                        'dependencies': GJ.jsonEncode(GJ.map(module.dependencies, function (dep) {
                            return dep.id;
                        })),
                        'stack': ex.stack,
                        'fn': fnStr
                    });

                    throw ex;
                }
            }
            if (module.status === STATUS.PAUSE) {
                return;
            } else {
                module.status = STATUS.COMPILED;
                defer.done();
            }
        }
        function cssLoader (uri) {
            // https://github.com/seajs/seajs/blob/master/src/util-fetch.js

            var UA = navigator.userAgent;

            // `onload` event is supported in WebKit since 535.23
            // Ref:
            //  - https://bugs.webkit.org/show_activity.cgi?id=38995
            var isOldWebKit = Number(UA.replace(/.*AppleWebKit\/(\d+)\..*/, '$1')) < 536;

            // `onload/onerror` event is supported since Firefox 9.0
            // Ref:
            //  - https://bugzilla.mozilla.org/show_bug.cgi?id=185236
            //  - https://developer.mozilla.org/en/HTML/Element/link#Stylesheet_load_events
            var isOldFirefox = UA.indexOf('Firefox') > 0 &&
                !('onload' in document.createElement('link'));

            var module = require.cache[uri];
            var node = doc.createElement("link");
            var timer;
            node.setAttribute('type', "text/css");
            node.setAttribute('href', getAbsoluteUrl(uri));
            node.setAttribute('rel', 'stylesheet');

            if (isOldWebKit || isOldFirefox) {
                setTimeout(function() {
                    poll(node, onCSSLoad);
                }, 1) // Begin after node insertion
            } else {
                node.onload = onCSSLoad;
                node.onerror = function () {
                    clearTimeout(timer);
                    headNode.removeChild(node);
                    moduleFail(uri, 'Load Fail');
                }
            }

            module.status = STATUS.FETCHING;
            headNode.appendChild(node);

            timer = setTimeout(function () {
                headNode.removeChild(node);
                moduleFail(uri, 'Load timeout');
            }, 30000); // 30s
            function onCSSLoad() {
                clearTimeout(timer);
                eventList.push([-(startTime - new Date), 'loaded', uri]);
                if (module.status === STATUS.FETCHING) {
                    module.status = STATUS.FETCHED;
                }
                moduleReady(uri);
            }
            function poll(node, callback) {
                var isLoaded;
                if (isOldWebKit) {                // for WebKit < 536
                    if (node['sheet']) {
                        isLoaded = true;
                    }
                } else if (node['sheet']) {       // for Firefox < 9.0
                    try {
                        if (node['sheet'].cssRules) {
                            isLoaded = true;
                        }
                    } catch (ex) {
                    // The value of `ex.name` is changed from
                    // 'NS_ERROR_DOM_SECURITY_ERR' to 'SecurityError' since Firefox 13.0
                    // But Firefox is less than 9.0 in here, So it is ok to just rely on
                    // 'NS_ERROR_DOM_SECURITY_ERR'
                        if (ex.name === 'NS_ERROR_DOM_SECURITY_ERR') {
                            isLoaded = true;
                        }
                    }
                }

                setTimeout(function() {
                    if (isLoaded) {
                        // Place callback in here due to giving time for style rendering.
                        callback();
                    } else {
                        poll(node, callback);
                    }
                }, 1);
            }

            return node;
        }


        function jsLoader (uri, onLoad) {
            var module = require.cache[uri];
            var timer;

            loadFromRemote();

            function loadFromRemote() {
                var timer = setTimeout(function () {
                    headNode.removeChild(node);
                    moduleFail(uri, 'Load timeout');
                }, 30000); // 30s
                var node = doc.createElement("script");
                var done = false;
                node.setAttribute('type', "text/javascript");
                node.setAttribute('src', getAbsoluteUrl(uri));
                node.setAttribute('async', true);

                node.onload = node.onreadystatechange = function(){
                    if (!done && (!this.readyState || this.readyState == "loaded" || this.readyState == "complete")){
                        done = true;
                        clearTimeout(timer);
                        eventList.push([-(startTime - new Date), 'loaded', uri]);
                        if (module.status === STATUS.FETCHING) {
                            module.status = STATUS.FETCHED;
                        }
                        if (GJ.isFunction(onLoad)) {
                            onLoad();
                        }
                        // 如果一个文件在script.onload之后状态还未变为STATUS.SAVED
                        // 则说明这个文件为外部文件
                        if (module.status < STATUS.SAVED) {
                            if (!/^http/.test(uri)) {
                                GJ.log('模块ID错误: '+uri);
                                GJ.tralog('GJ_ADD_INVALIDATE', uri);
                                if(!GJ.config.debug) {
                                    GJ.setCookie('use_https', 1, 86400); // 1 天
                                    GJ.config.defaultServer = 'https://sta.ganji.com';
                                }

                            } else {
                                moduleReady(uri);
                            }
                        }
                    }
                };

                node.onerror = function(e){
                    clearTimeout(timer);
                    headNode.removeChild(node);
                    moduleFail(uri, 'Load Fail');
                };
                module.status = STATUS.FETCHING;
                headNode.appendChild(node);
            }
        }
        function cmbFileLoader (uri) {
            var deps = combines[uri];
            var loader;
            if (!deps) {
                throw new Error(uri+'is not a combined js file');
            }
            deps = resolveDeps(deps);
            if (!debug) {
                // 将合并文件中的js文件标记为STATUS.FETCHING，防止重复抓取
                GJ.each(deps, function (dep) {
                    if (dep.status < STATUS.FETCHING && dep.uri.indexOf('.js') !== -1) {
                        dep.status = STATUS.FETCHING;
                    }
                });

                // 加载合并文件
                if (uri.indexOf('.css') === -1) {
                    loader = jsLoader;
                } else {
                    loader = cssLoader;
                }

                loader(uri, function () {
                    GJ.add(uri, combines[uri]);
                });
            } else {
                GJ.add(uri, combines[uri]);
            }
        }
        function loadFile (uri){
            eventList.push([-(startTime - new Date), 'fetching', uri]);
            if (combines[uri]) {
                return cmbFileLoader(uri);
            }
            var loaders = GJ.Module.fileLoaders;
            // TODO: jsonLoader
            for (var t in loaders) {
                if (loaders.hasOwnProperty(t)) {
                    if (uri.indexOf(t) !== -1) {
                        return loaders[t](uri);
                    }
                }
            }
            // default type is JS
            return loaders['.js'].call({
                require     : require
                ,defers     : defers
            }, uri);
        }
        var retryList = {}, defaultServerIndex = 0;
        function moduleFail (uri, reason) {
            if (retryList[uri]) {
                require.cache[uri].status = STATUS.FAILED;
                defers[uri].fail();
                GJ.errorStack.push({
                    'type': 'GJ_MODULE_FAIL',
                    'message': reason,
                    'uri': uri
                });
                throw new Error(reason + ": " + getAbsoluteUrl(uri));
            } else {
                retryList[uri] = true;

                if (/^http/.test(uri)) {
                    throw new Error(reason + ': ' + uri);
                }

                GJ.tralog('MODULE_LOAD_FAIL', GJ.config.defaultServer + ' - ' + uri);

                defaultServerIndex = defaultServerIndex+1 >= GJ.config.servers.length ? 0 : defaultServerIndex + 1;
                GJ.config.defaultServer = GJ.config.servers[defaultServerIndex];
                GJ.setCookie('STA_DS', defaultServerIndex);
                loadFile(uri);
            }
        }
        function resolveDeps (dependencies) {
            var deps = [];
            if (dependencies && typeof dependencies === 'string') {
                dependencies = dependencies.replace(/^ */, "");
                dependencies = dependencies.split(/[, \r\n\t\f]+/);
            }
            GJ.each(dependencies, function (uri) {
                GJ.each(require.resolve(uri), function (u) {
                    if (GJ.inArray(u, deps) === -1) {
                        deps.push(u);
                    }
                });
            });
            deps = GJ.map(deps, function (dep) {
                if (!require.cache[dep]) {
                    require.cache[dep] = {
                        id              : dep
                        ,uri            : dep
                        ,dependencies   : []
                        ,status         : 0
                    }
                    defers[dep] = GJ.Deferred();
                }
                return require.cache[dep];
            });
            return deps;
        }
    }();
})();
