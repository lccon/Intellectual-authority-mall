;(function($){
/**
 * jqGrid Chinese Translation for v4.2
 * henryyan 2011.11.30
 * http://www.wsria.com
 * Dual licensed under the MIT and GPL licenses:
 * http://www.opensource.org/licenses/mit-license.php
 * http://www.gnu.org/licenses/gpl.html
 * 
 * update 2011.11.30
 *		add double u3000 SPACE for search:odata to fix SEARCH box display err when narrow width from only use of eq/ne/cn/in/lt/gt operator under IE6/7
**/
$.jgrid = {
	defaults : {
		recordtext: "{0} - {1}\u3000共 {2} 条",	// 共字前是全角空格
		emptyrecords: "无数据显示",
		loadtext: "读取中...",
		pgtext : " {0} 共 {1} 页"
	},
	search : {
		caption: "搜索...",
		Find: "查找",
		Reset: "重置",
		odata : ['等于\u3000\u3000', '不等\u3000\u3000', '小于\u3000\u3000', '小于等于','大于\u3000\u3000','大于等于', 
			'开始于','不开始于','属于\u3000\u3000','不属于','结束于','不结束于','包含\u3000\u3000','不包含','空值于\u3000\u3000','非空值'],
		groupOps: [	{ op: "AND", text: "所有" },	{ op: "OR",  text: "任一" }	],
		matchText: " 匹配",
		rulesText: " 规则"
	},
	edit : {
		addCaption: "添加记录",
		editCaption: "编辑记录",
		bSubmit: "提交",
		bCancel: "取消",
		bClose: "关闭",
		saveData: "数据已改变，是否保存？",
		bYes : "是",
		bNo : "否",
		bExit : "取消",
		msg: {
			required:"此字段必需",
			number:"请输入有效数字",
			minValue:"输值必须大于等于 ",
			maxValue:"输值必须小于等于 ",
			email: "这不是有效的e-mail地址",
			integer: "请输入有效整数",
			date: "请输入有效时间",
			url: "无效网址。前缀必须为 ('http://' 或 'https://')",
			nodefined : " 未定义！",
			novalue : " 需要返回值！",
			customarray : "自定义函数需要返回数组！",
			customfcheck : "Custom function should be present in case of custom checking!"
			
		}
	},
	view : {
		caption: "查看记录",
		bClose: "关闭"
	},
	del : {
		caption: "删除",
		msg: "删除所选记录？",
		bSubmit: "删除",
		bCancel: "取消"
	},
	nav : {
		edittext: "",
		edittitle: "编辑所选记录",
		addtext:"",
		addtitle: "添加新记录",
		deltext: "",
		deltitle: "删除所选记录",
		searchtext: "",
		searchtitle: "查找",
		refreshtext: "",
		refreshtitle: "刷新表格",
		alertcap: "注意",
		alerttext: "请选择记录",
		viewtext: "",
		viewtitle: "查看所选记录"
	},
	col : {
		caption: "选择列",
		bSubmit: "确定",
		bCancel: "取消"
	},
	errors : {
		errcap : "错误",
		nourl : "没有设置url",
		norecords: "没有要处理的记录",
		model : "colNames 和 colModel 长度不等！"
	},
	formatter : {
		integer : {thousandsSeparator: " ", defaultValue: '0'},
		number : {decimalSeparator:".", thousandsSeparator: " ", decimalPlaces: 2, defaultValue: '0.00'},
		currency : {decimalSeparator:".", thousandsSeparator: " ", decimalPlaces: 2, prefix: "", suffix:"", defaultValue: '0.00'},
		date : {
			dayNames:   [
				"Sun", "Mon", "Tue", "Wed", "Thr", "Fri", "Sat",
		         "Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"
			],
			monthNames: [
				"Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec",
				"January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"
			],
			AmPm : ["am","pm","AM","PM"],
			S: function (j) {return j < 11 || j > 13 ? ['st', 'nd', 'rd', 'th'][Math.min((j - 1) % 10, 3)] : 'th'},
			srcformat: 'Y-m-d',
			newformat: 'm-d-Y',
			masks : {
				ISO8601Long:"Y-m-d H:i:s",
				ISO8601Short:"Y-m-d",
				ShortDate: "Y/j/n",
				LongDate: "l, F d, Y",
				FullDateTime: "l, F d, Y g:i:s A",
				MonthDay: "F d",
				ShortTime: "g:i A",
				LongTime: "g:i:s A",
				SortableDateTime: "Y-m-d\\TH:i:s",
				UniversalSortableDateTime: "Y-m-d H:i:sO",
				YearMonth: "F, Y"
			},
			reformatAfterEdit : false
		},
		baseLinkUrl: '',
		showAction: '',
		target: '',
		checkbox : {disabled:true},
		idName : 'id'
	}
};
})(jQuery);

/* 
* jqGrid  4.3.1 - jQuery Grid 
* Copyright (c) 2008, Tony Tomov, tony@trirand.com 
* Dual licensed under the MIT and GPL licenses 
* http://www.opensource.org/licenses/mit-license.php 
* http://www.gnu.org/licenses/gpl-2.0.html 
* Date:2011-12-20 
* Modules: grid.base.js; jquery.fmatter.js; grid.custom.js; grid.common.js; grid.formedit.js; grid.filter.js; grid.inlinedit.js; grid.celledit.js; jqModal.js; jqDnR.js; grid.subgrid.js; grid.grouping.js; grid.treegrid.js; grid.import.js; JsonXml.js; grid.tbltogrid.js; grid.jqueryui.js; 
*/
/*
 jqGrid  4.3.1  - jQuery Grid
 Copyright (c) 2008, Tony Tomov, tony@trirand.com
 Dual licensed under the MIT and GPL licenses
 http://www.opensource.org/licenses/mit-license.php
 http://www.gnu.org/licenses/gpl-2.0.html
 Date: 2011-12-20
*/
(function(b) {
    b.jgrid = b.jgrid || {};
    b.extend(b.jgrid, {
        htmlDecode: function(d) {
            if (d && (d == "&nbsp;" || d == "&#160;" || d.length === 1 && d.charCodeAt(0) === 160)) return "";
            return ! d ? d: String(d).replace(/&gt;/g, ">").replace(/&lt;/g, "<").replace(/&quot;/g, '"').replace(/&amp;/g, "&")
        },
        htmlEncode: function(d) {
            return ! d ? d: String(d).replace(/&/g, "&amp;").replace(/\"/g, "&quot;").replace(/</g, "&lt;").replace(/>/g, "&gt;")
        },
        format: function(d) {
            var i = b.makeArray(arguments).slice(1);
            if (d === undefined) d = "";
            return d.replace(/\{(\d+)\}/g,
            function(g, c) {
                return i[c]
            })
        },
        getCellIndex: function(d) {
            d = b(d);
            if (d.is("tr")) return - 1;
            d = (!d.is("td") && !d.is("th") ? d.closest("td,th") : d)[0];
            if (b.browser.msie) return b.inArray(d, d.parentNode.cells);
            return d.cellIndex
        },
        stripHtml: function(d) {
            d += "";
            var i = /<("[^"]*"|'[^']*'|[^'">])*>/gi;
            if (d) return (d = d.replace(i, "")) && d !== "&nbsp;" && d !== "&#160;" ? d.replace(/\"/g, "'") : "";
            else return d
        },
        realType: function(d) {
            return Object.prototype.toString.call(d).slice(8, -1)
        },
        stripPref: function(d, i) {
            var g = this.realType(d);
            if (g == "String" || g == "Number") {
                d = String(d);
                i = d !== "" ? String(i).replace(String(d), "") : i
            }
            return i
        },
        stringToDoc: function(d) {
            var i;
            if (typeof d !== "string") return d;
            try {
                i = (new DOMParser).parseFromString(d, "text/xml")
            } catch(g) {
                i = new ActiveXObject("Microsoft.XMLDOM");
                i.async = false;
                i.loadXML(d)
            }
            return i && i.documentElement && i.documentElement.tagName != "parsererror" ? i: null
        },
        parse: function(d) {
            if (d.substr(0, 9) == "while(1);") d = d.substr(9);
            if (d.substr(0, 2) == "/*") d = d.substr(2, d.length - 4);
            d || (d = "{}");
            return b.jgrid.useJSON === true && typeof JSON === "object" && typeof JSON.parse === "function" ? JSON.parse(d) : eval("(" + d + ")")
        },
        parseDate: function(d, i) {
            var g = {
                m: 1,
                d: 1,
                y: 1970,
                h: 0,
                i: 0,
                s: 0,
                u: 0
            },
            c,
            h,
            k;
            c = /[\\\/:_;.,\t\T\s-]/;
            if (i && i !== null && i !== undefined) {
                i = b.trim(i);
                i = i.split(c);
                d = d.split(c);
                var l = b.jgrid.formatter.date.monthNames,
                a = b.jgrid.formatter.date.AmPm,
                q = function(x, y) {
                    if (x === 0) {
                        if (y === 12) y = 0
                    } else if (y !== 12) y += 12;
                    return y
                };
                c = 0;
                for (h = d.length; c < h; c++) {
                    if (d[c] == "M") {
                        k = b.inArray(i[c], l);
                        if (k !== -1 && k < 12) i[c] = k + 1
                    }
                    if (d[c] == "F") {
                        k = b.inArray(i[c], l);
                        if (k !== -1 && k > 11) i[c] = k + 1 - 12
                    }
                    if (d[c] == "a") {
                        k = b.inArray(i[c], a);
                        if (k !== -1 && k < 2 && i[c] == a[k]) {
                            i[c] = k;
                            g.h = q(i[c], g.h)
                        }
                    }
                    if (d[c] == "A") {
                        k = b.inArray(i[c], a);
                        if (k !== -1 && k > 1 && i[c] == a[k]) {
                            i[c] = k - 2;
                            g.h = q(i[c], g.h)
                        }
                    }
                    if (i[c] !== undefined) g[d[c].toLowerCase()] = parseInt(i[c], 10)
                }
                g.m = parseInt(g.m, 10) - 1;
                c = g.y;
                if (c >= 70 && c <= 99) g.y = 1900 + g.y;
                else if (c >= 0 && c <= 69) g.y = 2E3 + g.y
            }
            return new Date(g.y, g.m, g.d, g.h, g.i, g.s, g.u)
        },
        jqID: function(d) {
            return String(d).replace(/[!"#$%&'()*+,.\/:;<=>?@\[\\\]\^`{|}~]/g, "\\$&")
        },
        guid: 1,
        uidPref: "jqg",
        randId: function(d) {
            return (d ? d: b.jgrid.uidPref) + b.jgrid.guid++
        },
        getAccessor: function(d, i) {
            var g, c, h = [],
            k;
            if (typeof i === "function") return i(d);
            g = d[i];
            if (g === undefined) try {
                if (typeof i === "string") h = i.split(".");
                if (k = h.length) for (g = d; g && k--;) {
                    c = h.shift();
                    g = g[c]
                }
            } catch(l) {}
            return g
        },
        getXmlData: function(d, i, g) {
            var c = typeof i === "string" ? i.match(/^(.*)\[(\w+)\]$/) : null;
            if (typeof i === "function") return i(d);
            if (c && c[2]) return c[1] ? b(c[1], d).attr(c[2]) : b(d).attr(c[2]);
            else {
                d = b(i, d);
                if (g) return d;
                return d.length > 0 ? b(d).text() : undefined
            }
        },
        ajaxOptions: {},
        from: function(d) {
            return new
            function(i, g) {
                if (typeof i == "string") i = b.data(i);
                var c = this,
                h = i,
                k = true,
                l = false,
                a = g,
                q = /[\$,%]/g,
                x = null,
                y = null,
                E = 0,
                I = false,
                M = "",
                N = [],
                V = true;
                if (typeof i == "object" && i.push) {
                    if (i.length > 0) V = typeof i[0] != "object" ? false: true
                } else throw "data provides is not an array";
                this._hasData = function() {
                    return h === null ? false: h.length === 0 ? false: true
                };
                this._getStr = function(o) {
                    var n = [];
                    l && n.push("jQuery.trim(");
                    n.push("String(" + o + ")");
                    l && n.push(")");
                    k || n.push(".toLowerCase()");
                    return n.join("")
                };
                this._strComp = function(o) {
                    return typeof o == "string" ? ".toString()": ""
                };
                this._group = function(o, n) {
                    return {
                        field: o.toString(),
                        unique: n,
                        items: []
                    }
                };
                this._toStr = function(o) {
                    if (l) o = b.trim(o);
                    k || (o = o.toLowerCase());
                    return o = o.toString().replace(/\\/g, "\\\\").replace(/\"/g, '\\"')
                };
                this._funcLoop = function(o) {
                    var n = [];
                    b.each(h,
                    function(t, F) {
                        n.push(o(F))
                    });
                    return n
                };
                this._append = function(o) {
                    var n;
                    if (a === null) a = "";
                    else a += M === "" ? " && ": M;
                    for (n = 0; n < E; n++) a += "(";
                    if (I) a += "!";
                    a += "(" + o + ")";
                    I = false;
                    M = "";
                    E = 0
                };
                this._setCommand = function(o, n) {
                    x = o;
                    y = n
                };
                this._resetNegate = function() {
                    I = false
                };
                this._repeatCommand = function(o, n) {
                    if (x === null) return c;
                    if (o !== null && n !== null) return x(o, n);
                    if (y === null) return x(o);
                    if (!V) return x(o);
                    return x(y, o)
                };
                this._equals = function(o, n) {
                    return c._compare(o, n, 1) === 0
                };
                this._compare = function(o, n, t) {
                    if (t === undefined) t = 1;
                    if (o === undefined) o = null;
                    if (n === undefined) n = null;
                    if (o === null && n === null) return 0;
                    if (o === null && n !== null) return 1;
                    if (o !== null && n === null) return - 1;
                    if (!k && typeof o !== "number" && typeof n !== "number") {
                        o = String(o).toLowerCase();
                        n = String(n).toLowerCase()
                    }
                    if (o < n) return - t;
                    if (o > n) return t;
                    return 0
                };
                this._performSort = function() {
                    if (N.length !== 0) h = c._doSort(h, 0)
                };
                this._doSort = function(o, n) {
                    var t = N[n].by,
                    F = N[n].dir,
                    T = N[n].type,
                    J = N[n].datefmt;
                    if (n == N.length - 1) return c._getOrder(o, t, F, T, J);
                    n++;
                    t = c._getGroup(o, t, F, T, J);
                    F = [];
                    for (T = 0; T < t.length; T++) {
                        J = c._doSort(t[T].items, n);
                        for (var D = 0; D < J.length; D++) F.push(J[D])
                    }
                    return F
                };
                this._getOrder = function(o, n, t, F, T) {
                    var J = [],
                    D = [],
                    ca = t == "a" ? 1 : -1,
                    X,
                    fa;
                    if (F === undefined) F = "text";
                    fa = F == "float" || F == "number" || F == "currency" || F == "numeric" ?
                    function(R) {
                        R = parseFloat(String(R).replace(q, ""));
                        return isNaN(R) ? 0 : R
                    }: F == "int" || F == "integer" ?
                    function(R) {
                        return R ? parseFloat(String(R).replace(q, "")) : 0
                    }: F == "date" || F == "datetime" ?
                    function(R) {
                        return b.jgrid.parseDate(T, R).getTime()
                    }: b.isFunction(F) ? F: function(R) {
                        R || (R = "");
                        return b.trim(String(R).toUpperCase())
                    };
                    b.each(o,
                    function(R, aa) {
                        X = n !== "" ? b.jgrid.getAccessor(aa, n) : aa;
                        if (X === undefined) X = "";
                        X = fa(X, aa);
                        D.push({
                            vSort: X,
                            index: R
                        })
                    });
                    D.sort(function(R, aa) {
                        R = R.vSort;
                        aa = aa.vSort;
                        return c._compare(R, aa, ca)
                    });
                    F = 0;
                    for (var pa = o.length; F < pa;) {
                        t = D[F].index;
                        J.push(o[t]);
                        F++
                    }
                    return J
                };
                this._getGroup = function(o, n, t, F, T) {
                    var J = [],
                    D = null,
                    ca = null,
                    X;
                    b.each(c._getOrder(o, n, t, F, T),
                    function(fa, pa) {
                        X = b.jgrid.getAccessor(pa, n);
                        if (X === undefined) X = "";
                        if (!c._equals(ca, X)) {
                            ca = X;
                            D !== null && J.push(D);
                            D = c._group(n, X)
                        }
                        D.items.push(pa)
                    });
                    D !== null && J.push(D);
                    return J
                };
                this.ignoreCase = function() {
                    k = false;
                    return c
                };
                this.useCase = function() {
                    k = true;
                    return c
                };
                this.trim = function() {
                    l = true;
                    return c
                };
                this.noTrim = function() {
                    l = false;
                    return c
                };
                this.execute = function() {
                    var o = a,
                    n = [];
                    if (o === null) return c;
                    b.each(h,
                    function() {
                        eval(o) && n.push(this)
                    });
                    h = n;
                    return c
                };
                this.data = function() {
                    return h
                };
                this.select = function(o) {
                    c._performSort();
                    if (!c._hasData()) return [];
                    c.execute();
                    if (b.isFunction(o)) {
                        var n = [];
                        b.each(h,
                        function(t, F) {
                            n.push(o(F))
                        });
                        return n
                    }
                    return h
                };
                this.hasMatch = function() {
                    if (!c._hasData()) return false;
                    c.execute();
                    return h.length > 0
                };
                this.andNot = function(o, n, t) {
                    I = !I;
                    return c.and(o, n, t)
                };
                this.orNot = function(o, n, t) {
                    I = !I;
                    return c.or(o, n, t)
                };
                this.not = function(o, n, t) {
                    return c.andNot(o, n, t)
                };
                this.and = function(o, n, t) {
                    M = " && ";
                    if (o === undefined) return c;
                    return c._repeatCommand(o, n, t)
                };
                this.or = function(o, n, t) {
                    M = " || ";
                    if (o === undefined) return c;
                    return c._repeatCommand(o, n, t)
                };
                this.orBegin = function() {
                    E++;
                    return c
                };
                this.orEnd = function() {
                    if (a !== null) a += ")";
                    return c
                };
                this.isNot = function(o) {
                    I = !I;
                    return c.is(o)
                };
                this.is = function(o) {
                    c._append("this." + o);
                    c._resetNegate();
                    return c
                };
                this._compareValues = function(o, n, t, F, T) {
                    var J;
                    J = V ? "jQuery.jgrid.getAccessor(this,'" + n + "')": "this";
                    if (t === undefined) t = null;
                    var D = t,
                    ca = T.stype === undefined ? "text": T.stype;
                    if (t !== null) switch (ca) {
                    case "int":
                    case "integer":
                        D = isNaN(Number(D)) || D === "" ? "0": D;
                        J = "parseInt(" + J + ",10)";
                        D = "parseInt(" + D + ",10)";
                        break;
                    case "float":
                    case "number":
                    case "numeric":
                        D = String(D).replace(q, "");
                        D = isNaN(Number(D)) || D === "" ? "0": D;
                        J = "parseFloat(" + J + ")";
                        D = "parseFloat(" + D + ")";
                        break;
                    case "date":
                    case "datetime":
                        D = String(b.jgrid.parseDate(T.newfmt || "Y-m-d", D).getTime());
                        J = 'jQuery.jgrid.parseDate("' + T.srcfmt + '",' + J + ").getTime()";
                        break;
                    default:
                        J = c._getStr(J);
                        D = c._getStr('"' + c._toStr(D) + '"')
                    }
                    c._append(J + " " + F + " " + D);
                    c._setCommand(o, n);
                    c._resetNegate();
                    return c
                };
                this.equals = function(o, n, t) {
                    return c._compareValues(c.equals, o, n, "==", t)
                };
                this.notEquals = function(o, n, t) {
                    return c._compareValues(c.equals, o, n, "!==", t)
                };
                this.isNull = function(o, n, t) {
                    return c._compareValues(c.equals, o, null, "===", t)
                };
                this.greater = function(o, n, t) {
                    return c._compareValues(c.greater, o, n, ">", t)
                };
                this.less = function(o, n, t) {
                    return c._compareValues(c.less, o, n, "<", t)
                };
                this.greaterOrEquals = function(o, n, t) {
                    return c._compareValues(c.greaterOrEquals, o, n, ">=", t)
                };
                this.lessOrEquals = function(o, n, t) {
                    return c._compareValues(c.lessOrEquals, o, n, "<=", t)
                };
                this.startsWith = function(o, n) {
                    var t = n === undefined || n === null ? o: n;
                    t = l ? b.trim(t.toString()).length: t.toString().length;
                    if (V) c._append(c._getStr("jQuery.jgrid.getAccessor(this,'" + o + "')") + ".substr(0," + t + ") == " + c._getStr('"' + c._toStr(n) + '"'));
                    else {
                        t = l ? b.trim(n.toString()).length: n.toString().length;
                        c._append(c._getStr("this") + ".substr(0," + t + ") == " + c._getStr('"' + c._toStr(o) + '"'))
                    }
                    c._setCommand(c.startsWith, o);
                    c._resetNegate();
                    return c
                };
                this.endsWith = function(o, n) {
                    var t = n === undefined || n === null ? o: n;
                    t = l ? b.trim(t.toString()).length: t.toString().length;
                    V ? c._append(c._getStr("jQuery.jgrid.getAccessor(this,'" + o + "')") + ".substr(" + c._getStr("jQuery.jgrid.getAccessor(this,'" + o + "')") + ".length-" + t + "," + t + ') == "' + c._toStr(n) + '"') : c._append(c._getStr("this") + ".substr(" + c._getStr("this") + '.length-"' + c._toStr(o) + '".length,"' + c._toStr(o) + '".length) == "' + c._toStr(o) + '"');
                    c._setCommand(c.endsWith, o);
                    c._resetNegate();
                    return c
                };
                this.contains = function(o, n) {
                    V ? c._append(c._getStr("jQuery.jgrid.getAccessor(this,'" + o + "')") + '.indexOf("' + c._toStr(n) + '",0) > -1') : c._append(c._getStr("this") + '.indexOf("' + c._toStr(o) + '",0) > -1');
                    c._setCommand(c.contains, o);
                    c._resetNegate();
                    return c
                };
                this.groupBy = function(o, n, t, F) {
                    if (!c._hasData()) return null;
                    return c._getGroup(h, o, n, t, F)
                };
                this.orderBy = function(o, n, t, F) {
                    n = n === undefined || n === null ? "a": b.trim(n.toString().toLowerCase());
                    if (t === null || t === undefined) t = "text";
                    if (F === null || F === undefined) F = "Y-m-d";
                    if (n == "desc" || n == "descending") n = "d";
                    if (n == "asc" || n == "ascending") n = "a";
                    N.push({
                        by: o,
                        dir: n,
                        type: t,
                        datefmt: F
                    });
                    return c
                };
                return c
            } (d, null)
        },
        extend: function(d) {
            b.extend(b.fn.jqGrid, d);
            this.no_legacy_api || b.fn.extend(d)
        }
    });
    b.fn.jqGrid = function(d) {
        if (typeof d == "string") {
            var i = b.jgrid.getAccessor(b.fn.jqGrid, d);
            if (!i) throw "jqGrid - No such method: " + d;
            var g = b.makeArray(arguments).slice(1);
            return i.apply(this, g)
        }
        return this.each(function() {
            if (!this.grid) {
                var c = b.extend(true, {
                    url: "",
                    height: 150,
                    page: 1,
                    rowNum: 20,
                    rowTotal: null,
                    records: 0,
                    pager: "",
                    pgbuttons: true,
                    pginput: true,
                    colModel: [],
                    rowList: [],
                    colNames: [],
                    sortorder: "asc",
                    sortname: "",
                    datatype: "xml",
                    mtype: "GET",
                    altRows: false,
                    selarrrow: [],
                    savedRow: [],
                    shrinkToFit: true,
                    xmlReader: {},
                    jsonReader: {},
                    subGrid: false,
                    subGridModel: [],
                    reccount: 0,
                    lastpage: 0,
                    lastsort: 0,
                    selrow: null,
                    beforeSelectRow: null,
                    onSelectRow: null,
                    onSortCol: null,
                    ondblClickRow: null,
                    onRightClickRow: null,
                    onPaging: null,
                    onSelectAll: null,
                    loadComplete: null,
                    gridComplete: null,
                    loadError: null,
                    loadBeforeSend: null,
                    afterInsertRow: null,
                    beforeRequest: null,
                    beforeProcessing: null,
                    onHeaderClick: null,
                    viewrecords: false,
                    loadonce: false,
                    multiselect: false,
                    multikey: false,
                    editurl: null,
                    search: false,
                    caption: "",
                    hidegrid: true,
                    hiddengrid: false,
                    postData: {},
                    userData: {},
                    treeGrid: false,
                    treeGridModel: "nested",
                    treeReader: {},
                    treeANode: -1,
                    ExpandColumn: null,
                    tree_root_level: 0,
                    prmNames: {
                        page: "page",
                        rows: "rows",
                        sort: "sidx",
                        order: "sord",
                        search: "_search",
                        nd: "nd",
                        id: "id",
                        oper: "oper",
                        editoper: "edit",
                        addoper: "add",
                        deloper: "del",
                        subgridid: "id",
                        npage: null,
                        totalrows: "totalrows"
                    },
                    forceFit: false,
                    gridstate: "visible",
                    cellEdit: false,
                    cellsubmit: "remote",
                    nv: 0,
                    loadui: "enable",
                    toolbar: [false, ""],
                    scroll: false,
                    multiboxonly: false,
                    deselectAfterSort: true,
                    scrollrows: false,
                    autowidth: false,
                    scrollOffset: 18,
                    cellLayout: 5,
                    subGridWidth: 20,
                    multiselectWidth: 20,
                    gridview: false,
                    rownumWidth: 25,
                    rownumbers: false,
                    pagerpos: "center",
                    recordpos: "right",
                    footerrow: false,
                    userDataOnFooter: false,
                    hoverrows: true,
                    altclass: "ui-priority-secondary",
                    viewsortcols: [false, "vertical", true],
                    resizeclass: "",
                    autoencode: false,
                    remapColumns: [],
                    ajaxGridOptions: {},
                    direction: "ltr",
                    toppager: false,
                    headertitles: false,
                    scrollTimeout: 40,
                    data: [],
                    _index: {},
                    grouping: false,
                    groupingView: {
                        groupField: [],
                        groupOrder: [],
                        groupText: [],
                        groupColumnShow: [],
                        groupSummary: [],
                        showSummaryOnHide: false,
                        sortitems: [],
                        sortnames: [],
                        groupDataSorted: false,
                        summary: [],
                        summaryval: [],
                        plusicon: "ui-icon-circlesmall-plus",
                        minusicon: "ui-icon-circlesmall-minus"
                    },
                    ignoreCase: false,
                    cmTemplate: {},
                    idPrefix: ""
                },
                b.jgrid.defaults, d || {}),
                h = {
                    headers: [],
                    cols: [],
                    footers: [],
                    dragStart: function(e, f, j) {
                        this.resizing = {
                            idx: e,
                            startX: f.clientX,
                            sOL: j[0]
                        };
                        this.hDiv.style.cursor = "col-resize";
                        this.curGbox = b("#rs_m" + b.jgrid.jqID(c.id), "#gbox_" + b.jgrid.jqID(c.id));
                        this.curGbox.css({
                            display: "block",
                            left: j[0],
                            top: j[1],
                            height: j[2]
                        });
                        b.isFunction(c.resizeStart) && c.resizeStart.call(this, f, e);
                        document.onselectstart = function() {
                            return false
                        }
                    },
                    dragMove: function(e) {
                        if (this.resizing) {
                            var f = e.clientX - this.resizing.startX;
                            e = this.headers[this.resizing.idx];
                            var j = c.direction === "ltr" ? e.width + f: e.width - f,
                            m;
                            if (j > 33) {
                                this.curGbox.css({
                                    left: this.resizing.sOL + f
                                });
                                if (c.forceFit === true) {
                                    m = this.headers[this.resizing.idx + c.nv];
                                    f = c.direction === "ltr" ? m.width - f: m.width + f;
                                    if (f > 33) {
                                        e.newWidth = j;
                                        m.newWidth = f
                                    }
                                } else {
                                    this.newWidth = c.direction === "ltr" ? c.tblwidth + f: c.tblwidth - f;
                                    e.newWidth = j
                                }
                            }
                        }
                    },
                    dragEnd: function() {
                        this.hDiv.style.cursor = "default";
                        if (this.resizing) {
                            var e = this.resizing.idx,
                            f = this.headers[e].newWidth || this.headers[e].width;
                            f = parseInt(f, 10);
                            this.resizing = false;
                            b("#rs_m" + b.jgrid.jqID(c.id)).css("display", "none");
                            c.colModel[e].width = f;
                            this.headers[e].width = f;
                            this.headers[e].el.style.width = f + "px";
                            this.cols[e].style.width = f + "px";
                            if (this.footers.length > 0) this.footers[e].style.width = f + "px";
                            if (c.forceFit === true) {
                                f = this.headers[e + c.nv].newWidth || this.headers[e + c.nv].width;
                                this.headers[e + c.nv].width = f;
                                this.headers[e + c.nv].el.style.width = f + "px";
                                this.cols[e + c.nv].style.width = f + "px";
                                if (this.footers.length > 0) this.footers[e + c.nv].style.width = f + "px";
                                c.colModel[e + c.nv].width = f
                            } else {
                                c.tblwidth = this.newWidth || c.tblwidth;
                                b("table:first", this.bDiv).css("width", c.tblwidth + "px");
                                b("table:first", this.hDiv).css("width", c.tblwidth + "px");
                                this.hDiv.scrollLeft = this.bDiv.scrollLeft;
                                if (c.footerrow) {
                                    b("table:first", this.sDiv).css("width", c.tblwidth + "px");
                                    this.sDiv.scrollLeft = this.bDiv.scrollLeft
                                }
                            }
                            b.isFunction(c.resizeStop) && c.resizeStop.call(this, f, e)
                        }
                        this.curGbox = null;
                        document.onselectstart = function() {
                            return true
                        }
                    },
                    populateVisible: function() {
                        h.timer && clearTimeout(h.timer);
                        h.timer = null;
                        var e = b(h.bDiv).height();
                        if (e) {
                            var f = b("table:first", h.bDiv),
                            j,
                            m;
                            if (f[0].rows.length) try {
                                m = (j = f[0].rows[1]) ? b(j).outerHeight() || h.prevRowHeight: h.prevRowHeight
                            } catch(p) {
                                m = h.prevRowHeight
                            }
                            if (m) {
                                h.prevRowHeight = m;
                                var C = c.rowNum;
                                j = h.scrollTop = h.bDiv.scrollTop;
                                var s = Math.round(f.position().top) - j,
                                A = s + f.height();
                                m *= C;
                                var z, u, w;
                                if (A < e && s <= 0 && (c.lastpage === undefined || parseInt((A + j + m - 1) / m, 10) <= c.lastpage)) {
                                    u = parseInt((e - A + m - 1) / m, 10);
                                    if (A >= 0 || u < 2 || c.scroll === true) {
                                        z = Math.round((A + j) / m) + 1;
                                        s = -1
                                    } else s = 1
                                }
                                if (s > 0) {
                                    z = parseInt(j / m, 10) + 1;
                                    u = parseInt((j + e) / m, 10) + 2 - z;
                                    w = true
                                }
                                if (u) if (! (c.lastpage && z > c.lastpage || c.lastpage == 1 || z === c.page && z === c.lastpage)) if (h.hDiv.loading) h.timer = setTimeout(h.populateVisible, c.scrollTimeout);
                                else {
                                    c.page = z;
                                    if (w) {
                                        h.selectionPreserver(f[0]);
                                        h.emptyRows(h.bDiv, false, false)
                                    }
                                    h.populate(u)
                                }
                            }
                        }
                    },
                    scrollGrid: function(e) {
                        if (c.scroll) {
                            var f = h.bDiv.scrollTop;
                            if (h.scrollTop === undefined) h.scrollTop = 0;
                            if (f != h.scrollTop) {
                                h.scrollTop = f;
                                h.timer && clearTimeout(h.timer);
                                h.timer = setTimeout(h.populateVisible, c.scrollTimeout)
                            }
                        }
                        h.hDiv.scrollLeft = h.bDiv.scrollLeft;
                        if (c.footerrow) h.sDiv.scrollLeft = h.bDiv.scrollLeft;
                        e && e.stopPropagation()
                    },
                    selectionPreserver: function(e) {
                        var f = e.p,
                        j = f.selrow,
                        m = f.selarrrow ? b.makeArray(f.selarrrow) : null,
                        p = e.grid.bDiv.scrollLeft,
                        C = f.gridComplete;
                        f.gridComplete = function() {
                            f.selrow = null;
                            f.selarrrow = [];
                            if (f.multiselect && m && m.length > 0) for (var s = 0; s < m.length; s++) m[s] != j && b(e).jqGrid("setSelection", m[s], false);
                            j && b(e).jqGrid("setSelection", j, false);
                            e.grid.bDiv.scrollLeft = p;
                            f.gridComplete = C;
                            f.gridComplete && C()
                        }
                    }
                };
                if (this.tagName.toUpperCase() != "TABLE") alert("Element is not a table");
                else {
                    b(this).empty().attr("tabindex", "1");
                    this.p = c;
                    this.p.useProp = !!b.fn.prop;
                    var k, l, a;
                    if (this.p.colNames.length === 0) for (k = 0; k < this.p.colModel.length; k++) this.p.colNames[k] = this.p.colModel[k].label || this.p.colModel[k].name;
                    if (this.p.colNames.length !== this.p.colModel.length) alert(b.jgrid.errors.model);
                    else {
                        var q = b("<div class='ui-jqgrid-view'></div>"),
                        x,
                        y = b.browser.msie ? true: false,
                        E = b.browser.webkit || b.browser.safari ? true: false;
                        a = this;
                        a.p.direction = b.trim(a.p.direction.toLowerCase());
                        if (b.inArray(a.p.direction, ["ltr", "rtl"]) == -1) a.p.direction = "ltr";
                        l = a.p.direction;
                        b(q).insertBefore(this);
                        b(this).appendTo(q).removeClass("scroll");
                        var I = b("<div class='ui-jqgrid ui-widget ui-widget-content ui-corner-all'></div>");
                        b(I).insertBefore(q).attr({
                            id: "gbox_" + this.id,
                            dir: l
                        });
                        b(q).appendTo(I).attr("id", "gview_" + this.id);
                        x = y && b.browser.version <= 6 ? '<iframe style="display:block;position:absolute;z-index:-1;filter:Alpha(Opacity=\'0\');" src="javascript:false;"></iframe>': "";
                        b("<div class='ui-widget-overlay jqgrid-overlay' id='lui_" + this.id + "'></div>").append(x).insertBefore(q);
                        b("<div class='loading ui-state-default ui-state-active' id='load_" + this.id + "'>" + this.p.loadtext + "</div>").insertBefore(q);
                        b(this).attr({
                            cellspacing: "0",
                            cellpadding: "0",
                            border: "0",
                            role: "grid",
                            "aria-multiselectable": !!this.p.multiselect,
                            "aria-labelledby": "gbox_" + this.id
                        });
                        var M = function(e, f) {
                            e = parseInt(e, 10);
                            return isNaN(e) ? f ? f: 0 : e
                        },
                        N = function(e, f, j, m, p, C) {
                            var s = a.p.colModel[e],
                            A = s.align,
                            z = 'style="',
                            u = s.classes,
                            w = s.name,
                            r = [];
                            if (A) z += "text-align:" + A + ";";
                            if (s.hidden === true) z += "display:none;";
                            if (f === 0) z += "width: " + h.headers[e].width + "px;";
                            else if (s.cellattr && b.isFunction(s.cellattr)) if ((e = s.cellattr.call(a, p, j, m, s, C)) && typeof e === "string") {
                                e = e.replace(/style/i, "style").replace(/title/i, "title");
                                if (e.indexOf("title") > -1) s.title = false;
                                if (e.indexOf("class") > -1) u = undefined;
                                r = e.split("style");
                                if (r.length === 2) {
                                    r[1] = b.trim(r[1].replace("=", ""));
                                    if (r[1].indexOf("'") === 0 || r[1].indexOf('"') === 0) r[1] = r[1].substring(1);
                                    z += r[1].replace(/'/gi, '"')
                                } else z += '"'
                            }
                            if (!r.length) {
                                r[0] = "";
                                z += '"'
                            }
                            z += (u !== undefined ? ' class="' + u + '"': "") + (s.title && j ? ' title="' + b.jgrid.stripHtml(j) + '"': "");
                            z += ' aria-describedby="' + a.p.id + "_" + w + '"';
                            return z + r[0]
                        },
                        V = function(e) {
                            return e === undefined || e === null || e === "" ? "&#160;": a.p.autoencode ? b.jgrid.htmlEncode(e) : e + ""
                        },
                        o = function(e, f, j, m, p) {
                            var C = a.p.colModel[j];
                            if (typeof C.formatter !== "undefined") {
                                e = {
                                    rowId: e,
                                    colModel: C,
                                    gid: a.p.id,
                                    pos: j
                                };
                                f = b.isFunction(C.formatter) ? C.formatter.call(a, f, e, m, p) : b.fmatter ? b.fn.fmatter(C.formatter, f, e, m, p) : V(f)
                            } else f = V(f);
                            return f
                        },
                        n = function(e, f, j, m, p) {
                            f = o(e, f, j, p, "add");
                            return '<td role="gridcell" ' + N(j, m, f, p, e, true) + ">" + f + "</td>"
                        },
                        t = function(e, f, j) {
                            var m = '<input role="checkbox" type="checkbox" id="jqg_' + a.p.id + "_" + e + '" class="cbox" name="jqg_' + a.p.id + "_" + e + '"/>';
                            return '<td role="gridcell" ' + N(f, j, "", null, e, true) + ">" + m + "</td>"
                        },
                        F = function(e, f, j, m) {
                            j = (parseInt(j, 10) - 1) * parseInt(m, 10) + 1 + f;
                            return '<td role="gridcell" class="ui-state-default jqgrid-rownum" ' + N(e, f, j, null, f, true) + ">" + j + "</td>"
                        },
                        T = function(e) {
                            var f, j = [],
                            m = 0,
                            p;
                            for (p = 0; p < a.p.colModel.length; p++) {
                                f = a.p.colModel[p];
                                if (f.name !== "cb" && f.name !== "subgrid" && f.name !== "rn") {
                                    j[m] = e == "local" ? f.name: e == "xml" || e === "xmlstring" ? f.xmlmap || f.name: f.jsonmap || f.name;
                                    m++
                                }
                            }
                            return j
                        },
                        J = function(e) {
                            var f = a.p.remapColumns;
                            if (!f || !f.length) f = b.map(a.p.colModel,
                            function(j, m) {
                                return m
                            });
                            if (e) f = b.map(f,
                            function(j) {
                                return j < e ? null: j - e
                            });
                            return f
                        },
                        D = function(e, f, j) {
                            if (a.p.deepempty) b("#" + b.jgrid.jqID(a.p.id) + " tbody:first tr:gt(0)").remove();
                            else {
                                var m = b("#" + b.jgrid.jqID(a.p.id) + " tbody:first tr:first")[0];
                                b("#" + b.jgrid.jqID(a.p.id) + " tbody:first").empty().append(m)
                            }
                            if (f && a.p.scroll) {
                                b(">div:first", e).css({
                                    height: "auto"
                                }).children("div:first").css({
                                    height: 0,
                                    display: "none"
                                });
                                e.scrollTop = 0
                            }
                            if (j === true) if (a.p.treeGrid === true) {
                                a.p.data = [];
                                a.p._index = {}
                            }
                        },
                        ca = function() {
                            var e = a.p.data.length,
                            f, j, m;
                            f = a.p.rownumbers === true ? 1 : 0;
                            j = a.p.multiselect === true ? 1 : 0;
                            m = a.p.subGrid === true ? 1 : 0;
                            f = a.p.keyIndex === false || a.p.loadonce === true ? a.p.localReader.id: a.p.colModel[a.p.keyIndex + j + m + f].name;
                            for (j = 0; j < e; j++) {
                                m = b.jgrid.getAccessor(a.p.data[j], f);
                                a.p._index[m] = j
                            }
                        },
                        X = function(e, f, j, m, p) {
                            var C = new Date,
                            s = a.p.datatype != "local" && a.p.loadonce || a.p.datatype == "xmlstring",
                            A = a.p.xmlReader,
                            z = a.p.datatype == "local" ? "local": "xml";
                            if (s) {
                                a.p.data = [];
                                a.p._index = {};
                                a.p.localReader.id = "_id_"
                            }
                            a.p.reccount = 0;
                            if (b.isXMLDoc(e)) {
                                if (a.p.treeANode === -1 && !a.p.scroll) {
                                    D(f, false, true);
                                    j = 1
                                } else j = j > 1 ? j: 1;
                                var u, w, r = 0,
                                G, O = 0,
                                S = 0,
                                K = 0,
                                L, Z = [],
                                P,
                                v = {},
                                B,
                                H,
                                U = [],
                                ia = a.p.altRows === true ? " " + a.p.altclass: "";
                                A.repeatitems || (Z = T(z));
                                L = a.p.keyIndex === false ? A.id: a.p.keyIndex;
                                if (Z.length > 0 && !isNaN(L)) {
                                    if (a.p.remapColumns && a.p.remapColumns.length) L = b.inArray(L, a.p.remapColumns);
                                    L = Z[L]
                                }
                                z = (L + "").indexOf("[") === -1 ? Z.length ?
                                function(ga, ba) {
                                    return b(L, ga).text() || ba
                                }: function(ga, ba) {
                                    return b(A.cell, ga).eq(L).text() || ba
                                }: function(ga, ba) {
                                    return ga.getAttribute(L.replace(/[\[\]]/g, "")) || ba
                                };
                                a.p.userData = {};
                                a.p.page = b.jgrid.getXmlData(e, A.page) || 0;
                                a.p.lastpage = b.jgrid.getXmlData(e, A.total);
                                if (a.p.lastpage === undefined) a.p.lastpage = 1;
                                a.p.records = b.jgrid.getXmlData(e, A.records) || 0;
                                if (b.isFunction(A.userdata)) a.p.userData = A.userdata.call(a, e) || {};
                                else b.jgrid.getXmlData(e, A.userdata, true).each(function() {
                                    a.p.userData[this.getAttribute("name")] = b(this).text()
                                });
                                e = b.jgrid.getXmlData(e, A.root, true); (e = b.jgrid.getXmlData(e, A.row, true)) || (e = []);
                                var $ = e.length,
                                W = 0,
                                ha = {},
                                ja = parseInt(a.p.rowNum, 10);
                                if ($ > 0 && a.p.page <= 0) a.p.page = 1;
                                if (e && $) {
                                    var qa = a.p.scroll ? b.jgrid.randId() : 1;
                                    if (p) ja *= p + 1;
                                    p = b.isFunction(a.p.afterInsertRow);
                                    var ya = "";
                                    if (a.p.grouping && a.p.groupingView.groupCollapse === true) ya = ' style="display:none;"';
                                    for (; W < $;) {
                                        B = e[W];
                                        H = z(B, qa + W);
                                        H = a.p.idPrefix + H;
                                        u = j === 0 ? 0 : j + 1;
                                        u = (u + W) % 2 == 1 ? ia: "";
                                        U.push("<tr" + ya + ' id="' + H + '" tabindex="-1" role="row" class ="ui-widget-content jqgrow ui-row-' + a.p.direction + "" + u + '">');
                                        if (a.p.rownumbers === true) {
                                            U.push(F(0, W, a.p.page, a.p.rowNum));
                                            K = 1
                                        }
                                        if (a.p.multiselect === true) {
                                            U.push(t(H, K, W));
                                            O = 1
                                        }
                                        if (a.p.subGrid === true) {
                                            U.push(b(a).jqGrid("addSubGridCell", O + K, W + j));
                                            S = 1
                                        }
                                        if (A.repeatitems) {
                                            P || (P = J(O + S + K));
                                            var Ca = b.jgrid.getXmlData(B, A.cell, true);
                                            b.each(P,
                                            function(ga) {
                                                var ba = Ca[this];
                                                if (!ba) return false;
                                                G = ba.textContent || ba.text;
                                                v[a.p.colModel[ga + O + S + K].name] = G;
                                                U.push(n(H, G, ga + O + S + K, W + j, B))
                                            })
                                        } else for (u = 0; u < Z.length; u++) {
                                            G = b.jgrid.getXmlData(B, Z[u]);
                                            v[a.p.colModel[u + O + S + K].name] = G;
                                            U.push(n(H, G, u + O + S + K, W + j, B))
                                        }
                                        U.push("</tr>");
                                        if (a.p.grouping) {
                                            u = a.p.groupingView.groupField.length;
                                            for (var Da = [], za = 0; za < u; za++) Da.push(v[a.p.groupingView.groupField[za]]);
                                            ha = b(a).jqGrid("groupingPrepare", U, Da, ha, v);
                                            U = []
                                        }
                                        if (s || a.p.treeGrid === true) {
                                            v._id_ = H;
                                            a.p.data.push(v);
                                            a.p._index[H] = a.p.data.length - 1
                                        }
                                        if (a.p.gridview === false) {
                                            b("tbody:first", f).append(U.join(""));
                                            p && a.p.afterInsertRow.call(a, H, v, B);
                                            U = []
                                        }
                                        v = {};
                                        r++;
                                        W++;
                                        if (r == ja) break
                                    }
                                }
                                if (a.p.gridview === true) {
                                    w = a.p.treeANode > -1 ? a.p.treeANode: 0;
                                    if (a.p.grouping) {
                                        b(a).jqGrid("groupingRender", ha, a.p.colModel.length);
                                        ha = null
                                    } else a.p.treeGrid === true && w > 0 ? b(a.rows[w]).after(U.join("")) : b("tbody:first", f).append(U.join(""))
                                }
                                if (a.p.subGrid === true) try {
                                    b(a).jqGrid("addSubGrid", O + K)
                                } catch(Ka) {}
                                a.p.totaltime = new Date - C;
                                if (r > 0) if (a.p.records === 0) a.p.records = $;
                                U = null;
                                if (a.p.treeGrid === true) try {
                                    b(a).jqGrid("setTreeNode", w + 1, r + w + 1)
                                } catch(La) {}
                                if (!a.p.treeGrid && !a.p.scroll) a.grid.bDiv.scrollTop = 0;
                                a.p.reccount = r;
                                a.p.treeANode = -1;
                                a.p.userDataOnFooter && b(a).jqGrid("footerData", "set", a.p.userData, true);
                                if (s) {
                                    a.p.records = $;
                                    a.p.lastpage = Math.ceil($ / ja)
                                }
                                m || a.updatepager(false, true);
                                if (s) for (; r < $;) {
                                    B = e[r];
                                    H = z(B, r);
                                    H = a.p.idPrefix + H;
                                    if (A.repeatitems) {
                                        P || (P = J(O + S + K));
                                        var Ha = b.jgrid.getXmlData(B, A.cell, true);
                                        b.each(P,
                                        function(ga) {
                                            var ba = Ha[this];
                                            if (!ba) return false;
                                            G = ba.textContent || ba.text;
                                            v[a.p.colModel[ga + O + S + K].name] = G
                                        })
                                    } else for (u = 0; u < Z.length; u++) {
                                        G = b.jgrid.getXmlData(B, Z[u]);
                                        v[a.p.colModel[u + O + S + K].name] = G
                                    }
                                    v._id_ = H;
                                    a.p.data.push(v);
                                    a.p._index[H] = a.p.data.length - 1;
                                    v = {};
                                    r++
                                }
                            }
                        },
                        fa = function(e, f, j, m, p) {
                            var C = new Date;
                            if (e) {
                                if (a.p.treeANode === -1 && !a.p.scroll) {
                                    D(f, false, true);
                                    j = 1
                                } else j = j > 1 ? j: 1;
                                var s, A = a.p.datatype != "local" && a.p.loadonce || a.p.datatype == "jsonstring";
                                if (A) {
                                    a.p.data = [];
                                    a.p._index = {};
                                    a.p.localReader.id = "_id_"
                                }
                                a.p.reccount = 0;
                                if (a.p.datatype == "local") {
                                    f = a.p.localReader;
                                    s = "local"
                                } else {
                                    f = a.p.jsonReader;
                                    s = "json"
                                }
                                var z = 0,
                                u, w, r = [],
                                G,
                                O = 0,
                                S = 0,
                                K = 0,
                                L,
                                Z,
                                P = {},
                                v,
                                B,
                                H = [],
                                U = a.p.altRows === true ? " " + a.p.altclass: "";
                                a.p.page = b.jgrid.getAccessor(e, f.page) || 0;
                                L = b.jgrid.getAccessor(e, f.total);
                                a.p.lastpage = L === undefined ? 1 : L;
                                a.p.records = b.jgrid.getAccessor(e, f.records) || 0;
                                a.p.userData = b.jgrid.getAccessor(e, f.userdata) || {};
                                f.repeatitems || (G = r = T(s));
                                s = a.p.keyIndex === false ? f.id: a.p.keyIndex;
                                if (r.length > 0 && !isNaN(s)) {
                                    if (a.p.remapColumns && a.p.remapColumns.length) s = b.inArray(s, a.p.remapColumns);
                                    s = r[s]
                                } (Z = b.jgrid.getAccessor(e, f.root)) || (Z = []);
                                L = Z.length;
                                e = 0;
                                if (L > 0 && a.p.page <= 0) a.p.page = 1;
                                var ia = parseInt(a.p.rowNum, 10),
                                $ = a.p.scroll ? b.jgrid.randId() : 1;
                                if (p) ia *= p + 1;
                                var W = b.isFunction(a.p.afterInsertRow),
                                ha = {},
                                ja = "";
                                if (a.p.grouping && a.p.groupingView.groupCollapse === true) ja = ' style="display:none;"';
                                for (; e < L;) {
                                    p = Z[e];
                                    B = b.jgrid.getAccessor(p, s);
                                    if (B === undefined) {
                                        B = $ + e;
                                        if (r.length === 0) if (f.cell) {
                                            u = b.jgrid.getAccessor(p, f.cell);
                                            B = u !== undefined ? u[s] || B: B
                                        }
                                    }
                                    B = a.p.idPrefix + B;
                                    u = j === 1 ? 0 : j;
                                    u = (u + e) % 2 == 1 ? U: "";
                                    H.push("<tr" + ja + ' id="' + B + '" tabindex="-1" role="row" class= "ui-widget-content jqgrow ui-row-' + a.p.direction + "" + u + '">');
                                    if (a.p.rownumbers === true) {
                                        H.push(F(0, e, a.p.page, a.p.rowNum));
                                        K = 1
                                    }
                                    if (a.p.multiselect) {
                                        H.push(t(B, K, e));
                                        O = 1
                                    }
                                    if (a.p.subGrid) {
                                        H.push(b(a).jqGrid("addSubGridCell", O + K, e + j));
                                        S = 1
                                    }
                                    if (f.repeatitems) {
                                        if (f.cell) p = b.jgrid.getAccessor(p, f.cell);
                                        G || (G = J(O + S + K))
                                    }
                                    for (w = 0; w < G.length; w++) {
                                        u = b.jgrid.getAccessor(p, G[w]);
                                        H.push(n(B, u, w + O + S + K, e + j, p));
                                        P[a.p.colModel[w + O + S + K].name] = u
                                    }
                                    H.push("</tr>");
                                    if (a.p.grouping) {
                                        u = a.p.groupingView.groupField.length;
                                        w = [];
                                        for (var qa = 0; qa < u; qa++) w.push(P[a.p.groupingView.groupField[qa]]);
                                        ha = b(a).jqGrid("groupingPrepare", H, w, ha, P);
                                        H = []
                                    }
                                    if (A || a.p.treeGrid === true) {
                                        P._id_ = B;
                                        a.p.data.push(P);
                                        a.p._index[B] = a.p.data.length - 1
                                    }
                                    if (a.p.gridview === false) {
                                        b("#" + b.jgrid.jqID(a.p.id) + " tbody:first").append(H.join(""));
                                        W && a.p.afterInsertRow.call(a, B, P, p);
                                        H = []
                                    }
                                    P = {};
                                    z++;
                                    e++;
                                    if (z == ia) break
                                }
                                if (a.p.gridview === true) {
                                    v = a.p.treeANode > -1 ? a.p.treeANode: 0;
                                    if (a.p.grouping) b(a).jqGrid("groupingRender", ha, a.p.colModel.length);
                                    else a.p.treeGrid === true && v > 0 ? b(a.rows[v]).after(H.join("")) : b("#" + b.jgrid.jqID(a.p.id) + " tbody:first").append(H.join(""))
                                }
                                if (a.p.subGrid === true) try {
                                    b(a).jqGrid("addSubGrid", O + K)
                                } catch(ya) {}
                                a.p.totaltime = new Date - C;
                                if (z > 0) if (a.p.records === 0) a.p.records = L;
                                if (a.p.treeGrid === true) try {
                                    b(a).jqGrid("setTreeNode", v + 1, z + v + 1)
                                } catch(Ca) {}
                                if (!a.p.treeGrid && !a.p.scroll) a.grid.bDiv.scrollTop = 0;
                                a.p.reccount = z;
                                a.p.treeANode = -1;
                                a.p.userDataOnFooter && b(a).jqGrid("footerData", "set", a.p.userData, true);
                                if (A) {
                                    a.p.records = L;
                                    a.p.lastpage = Math.ceil(L / ia)
                                }
                                m || a.updatepager(false, true);
                                if (A) for (; z < L && Z[z];) {
                                    p = Z[z];
                                    B = b.jgrid.getAccessor(p, s);
                                    if (B === undefined) {
                                        B = $ + z;
                                        if (r.length === 0) if (f.cell) B = b.jgrid.getAccessor(p, f.cell)[s] || B
                                    }
                                    if (p) {
                                        B = a.p.idPrefix + B;
                                        if (f.repeatitems) {
                                            if (f.cell) p = b.jgrid.getAccessor(p, f.cell);
                                            G || (G = J(O + S + K))
                                        }
                                        for (w = 0; w < G.length; w++) {
                                            u = b.jgrid.getAccessor(p, G[w]);
                                            P[a.p.colModel[w + O + S + K].name] = u
                                        }
                                        P._id_ = B;
                                        a.p.data.push(P);
                                        a.p._index[B] = a.p.data.length - 1;
                                        P = {}
                                    }
                                    z++
                                }
                            }
                        },
                        pa = function() {
                            function e(v) {
                                var B = 0,
                                H, U, ia, $, W;
                                if (v.groups !== undefined) { (U = v.groups.length && v.groupOp.toString().toUpperCase() === "OR") && r.orBegin();
                                    for (H = 0; H < v.groups.length; H++) {
                                        B > 0 && U && r.or();
                                        try {
                                            e(v.groups[H])
                                        } catch(ha) {
                                            alert(ha)
                                        }
                                        B++
                                    }
                                    U && r.orEnd()
                                }
                                if (v.rules !== undefined) {
                                    if (B > 0) {
                                        U = r.select();
                                        r = b.jgrid.from(U);
                                        if (a.p.ignoreCase) r = r.ignoreCase()
                                    }
                                    try { (ia = v.rules.length && v.groupOp.toString().toUpperCase() === "OR") && r.orBegin();
                                        for (H = 0; H < v.rules.length; H++) {
                                            W = v.rules[H];
                                            $ = v.groupOp.toString().toUpperCase();
                                            if (w[W.op] && W.field) {
                                                if (B > 0 && $ && $ === "OR") r = r.or();
                                                r = w[W.op](r, $)(W.field, W.data, m[W.field])
                                            }
                                            B++
                                        }
                                        ia && r.orEnd()
                                    } catch(ja) {
                                        alert(ja)
                                    }
                                }
                            }
                            var f, j = false,
                            m = {},
                            p = [],
                            C = [],
                            s,
                            A,
                            z;
                            if (b.isArray(a.p.data)) {
                                var u = a.p.grouping ? a.p.groupingView: false;
                                b.each(a.p.colModel,
                                function() {
                                    A = this.sorttype || "text";
                                    if (A == "date" || A == "datetime") {
                                        if (this.formatter && typeof this.formatter === "string" && this.formatter == "date") {
                                            s = this.formatoptions && this.formatoptions.srcformat ? this.formatoptions.srcformat: b.jgrid.formatter.date.srcformat;
                                            z = this.formatoptions && this.formatoptions.newformat ? this.formatoptions.newformat: b.jgrid.formatter.date.newformat
                                        } else s = z = this.datefmt || "Y-m-d";
                                        m[this.name] = {
                                            stype: A,
                                            srcfmt: s,
                                            newfmt: z
                                        }
                                    } else m[this.name] = {
                                        stype: A,
                                        srcfmt: "",
                                        newfmt: ""
                                    };
                                    if (a.p.grouping && this.name == u.groupField[0]) {
                                        var v = this.name;
                                        if (typeof this.index != "undefined") v = this.index;
                                        p[0] = m[v];
                                        C.push(v)
                                    }
                                    if (!j && (this.index == a.p.sortname || this.name == a.p.sortname)) {
                                        f = this.name;
                                        j = true
                                    }
                                });
                                if (a.p.treeGrid) b(a).jqGrid("SortTree", f, a.p.sortorder, m[f].stype, m[f].srcfmt);
                                else {
                                    var w = {
                                        eq: function(v) {
                                            return v.equals
                                        },
                                        ne: function(v) {
                                            return v.notEquals
                                        },
                                        lt: function(v) {
                                            return v.less
                                        },
                                        le: function(v) {
                                            return v.lessOrEquals
                                        },
                                        gt: function(v) {
                                            return v.greater
                                        },
                                        ge: function(v) {
                                            return v.greaterOrEquals
                                        },
                                        cn: function(v) {
                                            return v.contains
                                        },
                                        nc: function(v, B) {
                                            return B === "OR" ? v.orNot().contains: v.andNot().contains
                                        },
                                        bw: function(v) {
                                            return v.startsWith
                                        },
                                        bn: function(v, B) {
                                            return B === "OR" ? v.orNot().startsWith: v.andNot().startsWith
                                        },
                                        en: function(v, B) {
                                            return B === "OR" ? v.orNot().endsWith: v.andNot().endsWith
                                        },
                                        ew: function(v) {
                                            return v.endsWith
                                        },
                                        ni: function(v, B) {
                                            return B === "OR" ? v.orNot().equals: v.andNot().equals
                                        },
                                        "in": function(v) {
                                            return v.equals
                                        },
                                        nu: function(v) {
                                            return v.isNull
                                        },
                                        nn: function(v, B) {
                                            return B === "OR" ? v.orNot().isNull: v.andNot().isNull
                                        }
                                    },
                                    r = b.jgrid.from(a.p.data);
                                    if (a.p.ignoreCase) r = r.ignoreCase();
                                    if (a.p.search === true) {
                                        var G = a.p.postData.filters;
                                        if (G) {
                                            if (typeof G == "string") G = b.jgrid.parse(G);
                                            e(G)
                                        } else try {
                                            r = w[a.p.postData.searchOper](r)(a.p.postData.searchField, a.p.postData.searchString, m[a.p.postData.searchField])
                                        } catch(O) {}
                                    }
                                    if (a.p.grouping) {
                                        r.orderBy(C, u.groupOrder[0], p[0].stype, p[0].srcfmt);
                                        u.groupDataSorted = true
                                    }
                                    if (f && a.p.sortorder && j) a.p.sortorder.toUpperCase() == "DESC" ? r.orderBy(a.p.sortname, "d", m[f].stype, m[f].srcfmt) : r.orderBy(a.p.sortname, "a", m[f].stype, m[f].srcfmt);
                                    G = r.select();
                                    var S = parseInt(a.p.rowNum, 10),
                                    K = G.length,
                                    L = parseInt(a.p.page, 10),
                                    Z = Math.ceil(K / S),
                                    P = {};
                                    G = G.slice((L - 1) * S, L * S);
                                    m = r = null;
                                    P[a.p.localReader.total] = Z;
                                    P[a.p.localReader.page] = L;
                                    P[a.p.localReader.records] = K;
                                    P[a.p.localReader.root] = G;
                                    P[a.p.localReader.userdata] = a.p.userData;
                                    G = null;
                                    return P
                                }
                            }
                        },
                        R = function() {
                            a.grid.hDiv.loading = true;
                            if (!a.p.hiddengrid) switch (a.p.loadui) {
                            case "enable":
                                b("#load_" + b.jgrid.jqID(a.p.id)).show();
                                break;
                            case "block":
                                b("#lui_" + b.jgrid.jqID(a.p.id)).show();
                                b("#load_" + b.jgrid.jqID(a.p.id)).show()
                            }
                        },
                        aa = function() {
                            a.grid.hDiv.loading = false;
                            switch (a.p.loadui) {
                            case "enable":
                                b("#load_" + b.jgrid.jqID(a.p.id)).hide();
                                break;
                            case "block":
                                b("#lui_" + b.jgrid.jqID(a.p.id)).hide();
                                b("#load_" + b.jgrid.jqID(a.p.id)).hide()
                            }
                        },
                        ka = function(e) {
                            if (!a.grid.hDiv.loading) {
                                var f = a.p.scroll && e === false,
                                j = {},
                                m, p = a.p.prmNames;
                                if (a.p.page <= 0) a.p.page = 1;
                                if (p.search !== null) j[p.search] = a.p.search;
                                if (p.nd !== null) j[p.nd] = (new Date).getTime();
                                if (p.rows !== null) j[p.rows] = a.p.rowNum;
                                if (p.page !== null) j[p.page] = a.p.page;
                                if (p.sort !== null) j[p.sort] = a.p.sortname;
                                if (p.order !== null) j[p.order] = a.p.sortorder;
                                if (a.p.rowTotal !== null && p.totalrows !== null) j[p.totalrows] = a.p.rowTotal;
                                var C = a.p.loadComplete,
                                s = b.isFunction(C);
                                s || (C = null);
                                var A = 0;
                                e = e || 1;
                                if (e > 1) if (p.npage !== null) {
                                    j[p.npage] = e;
                                    A = e - 1;
                                    e = 1
                                } else C = function(u) {
                                    a.p.page++;
                                    a.grid.hDiv.loading = false;
                                    s && a.p.loadComplete.call(a, u);
                                    ka(e - 1)
                                };
                                else p.npage !== null && delete a.p.postData[p.npage];
                                if (a.p.grouping) {
                                    b(a).jqGrid("groupingSetup");
                                    if (a.p.groupingView.groupDataSorted === true) j[p.sort] = a.p.groupingView.groupField[0] + " " + a.p.groupingView.groupOrder[0] + ", " + j[p.sort]
                                }
                                b.extend(a.p.postData, j);
                                var z = !a.p.scroll ? 1 : a.rows.length - 1;
                                if (b.isFunction(a.p.datatype)) a.p.datatype.call(a, a.p.postData, "load_" + a.p.id);
                                else {
                                    if (b.isFunction(a.p.beforeRequest)) {
                                        j = a.p.beforeRequest.call(a);
                                        if (j === undefined) j = true;
                                        if (j === false) return
                                    }
                                    m = a.p.datatype.toLowerCase();
                                    switch (m) {
                                    case "json":
                                    case "jsonp":
                                    case "xml":
                                    case "script":
                                        b.ajax(b.extend({
                                            url:
                                            a.p.url,
                                            type: a.p.mtype,
                                            dataType: m,
                                            data: b.isFunction(a.p.serializeGridData) ? a.p.serializeGridData.call(a, a.p.postData) : a.p.postData,
                                            success: function(u, w, r) {
                                            	//console.log(u)
                                            	/*u={
                                            		    "total": 3,
                                            		    "records": 10,  
                                            		    "page": 1,
                                            		    "rows": [{
                                            		        "id": 1,
                                            		        "createDate": 1421047234335,
                                            		        "createUser": "temp",
                                            		        "updateDate": null,
                                            		        "updateUser": null,
                                            		        "peopleId": null,
                                            		        "orgId": null,
                                            		        "orgCode": null,
                                            		        "name": "小张",
                                            		        "idcardNum": "333333199011019999",
                                            		        "gender": "女",
                                            		        "age": 18,
                                            		        "nation": null,
                                            		        "birthday": null,
                                            		        "placeOrigin": null,
                                            		        "schooling": null,
                                            		        "maritalState": null,
                                            		        "homeEnv": null,
                                            		        "mobileNumber": null,
                                            		        "telephone": null,
                                            		        "specialContribution": null,
                                            		        "pensionType": null,
                                            		        "communityContactWay": null,
                                            		        "district": null,
                                            		        "town": null,
                                            		        "community": null,
                                            		        "resideDistrict": null,
                                            		        "resideTown": null,
                                            		        "resideCommunity": null,
                                            		        "agentName": null,
                                            		        "withApplicantRelation": null,
                                            		        "agentAddress": "啊好难噶撒旦发生地方",
                                            		        "agentTelephone": null,
                                            		        "agentMobileNumber": null,
                                            		        "assessmentCase": null,
                                            		        "status": "好",
                                            		        "reviewId": null,
                                            		        "assessmentResult": "好"
                                            		    },
                                            		    {
                                            		        "id": 1,
                                            		        "createDate": 1421047234335,
                                            		        "createUser": "temp",
                                            		        "updateDate": null,
                                            		        "updateUser": null,
                                            		        "peopleId": null,
                                            		        "orgId": null,
                                            		        "orgCode": null,
                                            		        "name": "小李",
                                            		        "idcardNum": "333333199011019999",
                                            		        "gender": "男",
                                            		        "age": 20,
                                            		        "nation": null,
                                            		        "birthday": null,
                                            		        "placeOrigin": null,
                                            		        "schooling": null,
                                            		        "maritalState": null,
                                            		        "homeEnv": null,
                                            		        "mobileNumber": null,
                                            		        "telephone": null,
                                            		        "specialContribution": null,
                                            		        "pensionType": null,
                                            		        "communityContactWay": null,
                                            		        "district": null,
                                            		        "town": null,
                                            		        "community": null,
                                            		        "resideDistrict": null,
                                            		        "resideTown": null,
                                            		        "resideCommunity": null,
                                            		        "agentName": null,
                                            		        "withApplicantRelation": null,
                                            		        "agentAddress": "啊好难噶撒旦发生地方",
                                            		        "agentTelephone": null,
                                            		        "agentMobileNumber": null,
                                            		        "assessmentCase": null,
                                            		        "status": "好",
                                            		        "reviewId": null,
                                            		        "assessmentResult": "好"
                                            		    }]
                                            		};*/
                                                b.isFunction(a.p.beforeProcessing) && a.p.beforeProcessing.call(a, u, w, r);
                                                m === "xml" ? X(u, a.grid.bDiv, z, e > 1, A) : fa(u, a.grid.bDiv, z, e > 1, A);
                                                C && C.call(a, u);
                                                f && a.grid.populateVisible();
                                                if (a.p.loadonce || a.p.treeGrid) a.p.datatype = "local";
                                                e === 1 && aa();
                                            },
                                            error: function(u, w, r) {
                                                b.isFunction(a.p.loadError) && a.p.loadError.call(a, u, w, r);
                                                e === 1 && aa();
                                                
                                                
                                            },
                                            beforeSend: function(u, w) {
                                                var r = true;
                                                if (b.isFunction(a.p.loadBeforeSend)) r = a.p.loadBeforeSend.call(a, u, w);
                                                if (r === undefined) r = true;
                                                if (r === false) return false;
                                                else R()
                                            }
                                        },
                                        b.jgrid.ajaxOptions, a.p.ajaxGridOptions));
                                        break;
                                    case "xmlstring":
                                        R();
                                        j = b.jgrid.stringToDoc(a.p.datastr);
                                        X(j, a.grid.bDiv);
                                        s && a.p.loadComplete.call(a, j);
                                        a.p.datatype = "local";
                                        a.p.datastr = null;
                                        aa();
                                        break;
                                    case "jsonstring":
                                        R();
                                        j = typeof a.p.datastr == "string" ? b.jgrid.parse(a.p.datastr) : a.p.datastr;
                                        fa(j, a.grid.bDiv);
                                        s && a.p.loadComplete.call(a, j);
                                        a.p.datatype = "local";
                                        a.p.datastr = null;
                                        aa();
                                        break;
                                    case "local":
                                    case "clientside":
                                        R();
                                        a.p.datatype = "local";
                                        j = pa();
                                        fa(j, a.grid.bDiv, z, e > 1, A);
                                        C && C.call(a, j);
                                        f && a.grid.populateVisible();
                                        aa()
                                    }
                                }
                            }
                        },
                        sa = function(e) {
                            b("#cb_" + b.jgrid.jqID(a.p.id), a.grid.hDiv)[a.p.useProp ? "prop": "attr"]("checked", e);
                            if (a.p.frozenColumns && a.p.id + "_frozen") b("#cb_" + b.jgrid.jqID(a.p.id), a.grid.fhDiv)[a.p.useProp ? "prop": "attr"]("checked", e)
                        };
                        x = function(e, f) {
                            var j = "",
                            m = "<table cellspacing='0' cellpadding='0' border='0' style='table-layout:auto;' class='ui-pg-table'><tbody><tr>",
                            p = "",
                            C, s, A, z, u = function(w) {
                                var r;
                                if (b.isFunction(a.p.onPaging)) r = a.p.onPaging.call(a, w);
                                a.p.selrow = null;
                                if (a.p.multiselect) {
                                    a.p.selarrrow = [];
                                    sa(false)
                                }
                                a.p.savedRow = [];
                                if (r == "stop") return false;
                                return true
                            };
                            e = e.substr(1);
                            f += "_" + e;
                            C = "pg_" + e;
                            s = e + "_left";
                            A = e + "_center";
                            z = e + "_right";
                            b("#" + b.jgrid.jqID(e)).append("<div id='" + C + "' class='ui-pager-control' role='group'><table cellspacing='0' cellpadding='0' border='0' class='ui-pg-table' style='width:100%;table-layout:fixed;height:100%;' role='row'><tbody><tr><td class='ui-pg-table-left' id='" + s + "' align='left'></td><td class='ui-pg-table-center' id='" + A + "' align='center' style='white-space:pre;'></td><td class='ui-pg-table-right' id='" + z + "' align='right'></td></tr></tbody></table></div>").attr("dir", "ltr");
                            if (a.p.rowList.length > 0) {
                                p = "<td dir='" + l + "'>";
                                p += "<select class='ui-pg-selbox' role='listbox'>";
                                for (s = 0; s < a.p.rowList.length; s++) p += '<option role="option" value="' + a.p.rowList[s] + '"' + (a.p.rowNum == a.p.rowList[s] ? ' selected="selected"': "") + ">" + a.p.rowList[s] + "</option>";
                                p += "</select></td>"
                            }
                            if (l == "rtl") m += p;
                            if (a.p.pginput === true) j = "<td dir='" + l + "'>" + b.jgrid.format(a.p.pgtext || "", "<input class='ui-pg-input' type='text' size='2' maxlength='7' value='0' role='textbox'/>", "<span id='sp_1_" + b.jgrid.jqID(e) + "'></span>") + "</td>";
                            if (a.p.pgbuttons === true) {
                                s = ["first" + f, "prev" + f, "next" + f, "last" + f];
                                l == "rtl" && s.reverse();
                                m += "<td id='" + s[0] + "' class='ui-pg-button ui-corner-all'><span class='ui-icon ui-icon-seek-first'></span></td>";
                                m += "<td id='" + s[1] + "' class='ui-pg-button ui-corner-all'><span class='ui-icon ui-icon-seek-prev'></span></td>";
                                m += j !== "" ? "<td class='ui-pg-button ui-state-disabled' style='width:4px;'><span class='ui-separator'></span></td>" + j + "<td class='ui-pg-button ui-state-disabled' style='width:4px;'><span class='ui-separator'></span></td>": "";
                                m += "<td id='" + s[2] + "' class='ui-pg-button ui-corner-all'><span class='ui-icon ui-icon-seek-next'></span></td>";
                                m += "<td id='" + s[3] + "' class='ui-pg-button ui-corner-all'><span class='ui-icon ui-icon-seek-end'></span></td>"
                            } else if (j !== "") m += j;
                            if (l == "ltr") m += p;
                            m += "</tr></tbody></table>";
                            a.p.viewrecords === true && b("td#" + e + "_" + a.p.recordpos, "#" + C).append("<div dir='" + l + "' style='text-align:" + a.p.recordpos + "' class='ui-paging-info'></div>");
                            b("td#" + e + "_" + a.p.pagerpos, "#" + C).append(m);
                            p = b(".ui-jqgrid").css("font-size") || "11px";
                            b(document.body).append("<div id='testpg' class='ui-jqgrid ui-widget ui-widget-content' style='font-size:" + p + ";visibility:hidden;' ></div>");
                            m = b(m).clone().appendTo("#testpg").width();
                            b("#testpg").remove();
                            if (m > 0) {
                                if (j !== "") m += 50;
                                b("td#" + e + "_" + a.p.pagerpos, "#" + C).width(m)
                            }
                            a.p._nvtd = [];
                            a.p._nvtd[0] = m ? Math.floor((a.p.width - m) / 2) : Math.floor(a.p.width / 3);
                            a.p._nvtd[1] = 0;
                            m = null;
                            b(".ui-pg-selbox", "#" + C).bind("change",
                            function() {
                                a.p.page = Math.round(a.p.rowNum * (a.p.page - 1) / this.value - 0.5) + 1;
                                a.p.rowNum = this.value;
                                if (f) b(".ui-pg-selbox", a.p.pager).val(this.value);
                                else a.p.toppager && b(".ui-pg-selbox", a.p.toppager).val(this.value);
                                if (!u("records")) return false;
                                ka();
                                return false
                            });
                            if (a.p.pgbuttons === true) {
                                b(".ui-pg-button", "#" + C).hover(function() {
                                    if (b(this).hasClass("ui-state-disabled")) this.style.cursor = "default";
                                    else {
                                        b(this).addClass("ui-state-hover");
                                        this.style.cursor = "pointer"
                                    }
                                },
                                function() {
                                    if (!b(this).hasClass("ui-state-disabled")) {
                                        b(this).removeClass("ui-state-hover");
                                        this.style.cursor = "default"
                                    }
                                });
                                b("#first" + b.jgrid.jqID(f) + ", #prev" + b.jgrid.jqID(f) + ", #next" + b.jgrid.jqID(f) + ", #last" + b.jgrid.jqID(f)).click(function() {
                                    var w = M(a.p.page, 1),
                                    r = M(a.p.lastpage, 1),
                                    G = false,
                                    O = true,
                                    S = true,
                                    K = true,
                                    L = true;
                                    if (r === 0 || r === 1) L = K = S = O = false;
                                    else if (r > 1 && w >= 1) if (w === 1) S = O = false;
                                    else {
                                        if (w === r) L = K = false
                                    } else if (r > 1 && w === 0) {
                                        L = K = false;
                                        w = r - 1
                                    }
                                    if (this.id === "first" + f && O) {
                                        a.p.page = 1;
                                        G = true
                                    }
                                    if (this.id === "prev" + f && S) {
                                        a.p.page = w - 1;
                                        G = true
                                    }
                                    if (this.id === "next" + f && K) {
                                        a.p.page = w + 1;
                                        G = true
                                    }
                                    if (this.id === "last" + f && L) {
                                        a.p.page = r;
                                        G = true
                                    }
                                    if (G) {
                                        if (!u(this.id)) return false;
                                        ka()
                                    }
                                    return false
                                })
                            }
                            a.p.pginput === true && b("input.ui-pg-input", "#" + C).keypress(function(w) {
                                if ((w.charCode ? w.charCode: w.keyCode ? w.keyCode: 0) == 13) {
                                    a.p.page = b(this).val() > 0 ? b(this).val() : a.p.page;
                                    if (!u("user")) return false;
                                    ka();
                                    return false
                                }
                                return this
                            })
                        };
                        var Ea = function(e, f, j, m) {
                            if (a.p.colModel[f].sortable) if (! (a.p.savedRow.length > 0)) {
                                if (!j) {
                                    if (a.p.lastsort == f) if (a.p.sortorder == "asc") a.p.sortorder = "desc";
                                    else {
                                        if (a.p.sortorder == "desc") a.p.sortorder = "asc"
                                    } else a.p.sortorder = a.p.colModel[f].firstsortorder || "asc";
                                    a.p.page = 1
                                }
                                if (m) if (a.p.lastsort == f && a.p.sortorder == m && !j) return;
                                else a.p.sortorder = m;
                                j = a.grid.headers[a.p.lastsort].el;
                                m = a.grid.headers[f].el;
                                b("span.ui-grid-ico-sort", j).addClass("ui-state-disabled");
                                b(j).attr("aria-selected", "false");
                                b("span.ui-icon-" + a.p.sortorder, m).removeClass("ui-state-disabled");
                                b(m).attr("aria-selected", "true");
                                if (!a.p.viewsortcols[0]) if (a.p.lastsort != f) {
                                    b("span.s-ico", j).hide();
                                    b("span.s-ico", m).show()
                                }
                                e = e.substring(5 + a.p.id.length + 1);
                                a.p.sortname = a.p.colModel[f].index || e;
                                j = a.p.sortorder;
                                if (b.isFunction(a.p.onSortCol)) if (a.p.onSortCol.call(a, e, f, j) == "stop") {
                                    a.p.lastsort = f;
                                    return
                                }
                                if (a.p.datatype == "local") a.p.deselectAfterSort && b(a).jqGrid("resetSelection");
                                else {
                                    a.p.selrow = null;
                                    a.p.multiselect && sa(false);
                                    a.p.selarrrow = [];
                                    a.p.savedRow = []
                                }
                                if (a.p.scroll) {
                                    j = a.grid.bDiv.scrollLeft;
                                    D(a.grid.bDiv, true, false);
                                    a.grid.hDiv.scrollLeft = j
                                }
                                a.p.subGrid && a.p.datatype == "local" && b("td.sgexpanded", "#" + b.jgrid.jqID(a.p.id)).each(function() {
                                    b(this).trigger("click")
                                });
                                ka();
                                a.p.lastsort = f;
                                if (a.p.sortname != e && f) a.p.lastsort = f
                            }
                        },
                        Ia = function(e) {
                            var f, j = {},
                            m = E ? 0 : a.p.cellLayout;
                            for (f = j[0] = j[1] = j[2] = 0; f <= e; f++) if (a.p.colModel[f].hidden === false) j[0] += a.p.colModel[f].width + m;
                            if (a.p.direction == "rtl") j[0] = a.p.width - j[0];
                            j[0] -= a.grid.bDiv.scrollLeft;
                            if (b(a.grid.cDiv).is(":visible")) j[1] += b(a.grid.cDiv).height() + parseInt(b(a.grid.cDiv).css("padding-top"), 10) + parseInt(b(a.grid.cDiv).css("padding-bottom"), 10);
                            if (a.p.toolbar[0] === true && (a.p.toolbar[1] == "top" || a.p.toolbar[1] == "both")) j[1] += b(a.grid.uDiv).height() + parseInt(b(a.grid.uDiv).css("border-top-width"), 10) + parseInt(b(a.grid.uDiv).css("border-bottom-width"), 10);
                            if (a.p.toppager) j[1] += b(a.grid.topDiv).height() + parseInt(b(a.grid.topDiv).css("border-bottom-width"), 10);
                            j[2] += b(a.grid.bDiv).height() + b(a.grid.hDiv).height();
                            return j
                        },
                        Fa = function(e) {
                            var f, j = a.grid.headers,
                            m = b.jgrid.getCellIndex(e);
                            for (f = 0; f < j.length; f++) if (e === j[f].el) {
                                m = f;
                                break
                            }
                            return m
                        };
                        this.p.id = this.id;
                        if (b.inArray(a.p.multikey, ["shiftKey", "altKey", "ctrlKey"]) == -1) a.p.multikey = false;
                        a.p.keyIndex = false;
                        for (k = 0; k < a.p.colModel.length; k++) {
                            a.p.colModel[k] = b.extend(true, {},
                            a.p.cmTemplate, a.p.colModel[k].template || {},
                            a.p.colModel[k]);
                            if (a.p.keyIndex === false && a.p.colModel[k].key === true) a.p.keyIndex = k
                        }
                        a.p.sortorder = a.p.sortorder.toLowerCase();
                        if (a.p.grouping === true) {
                            a.p.scroll = false;
                            a.p.rownumbers = false;
                            a.p.subGrid = false;
                            a.p.treeGrid = false;
                            a.p.gridview = true
                        }
                        if (this.p.treeGrid === true) {
                            try {
                                b(this).jqGrid("setTreeGrid")
                            } catch(Ma) {}
                            if (a.p.datatype != "local") a.p.localReader = {
                                id: "_id_"
                            }
                        }
                        if (this.p.subGrid) try {
                            b(a).jqGrid("setSubGrid")
                        } catch(Na) {}
                        if (this.p.multiselect) {
                            this.p.colNames.unshift("<input role='checkbox' id='cb_" + this.p.id + "' class='cbox' type='checkbox'/>");
                            this.p.colModel.unshift({
                                name: "cb",
                                width: E ? a.p.multiselectWidth + a.p.cellLayout: a.p.multiselectWidth,
                                sortable: false,
                                resizable: false,
                                hidedlg: true,
                                search: false,
                                align: "center",
                                fixed: true
                            })
                        }
                        if (this.p.rownumbers) {
                            this.p.colNames.unshift("");
                            this.p.colModel.unshift({
                                name: "rn",
                                width: a.p.rownumWidth,
                                sortable: false,
                                resizable: false,
                                hidedlg: true,
                                search: false,
                                align: "center",
                                fixed: true
                            })
                        }
                        a.p.xmlReader = b.extend(true, {
                            root: "rows",
                            row: "row",
                            page: "rows>page",
                            total: "rows>total",
                            records: "rows>records",
                            repeatitems: true,
                            cell: "cell",
                            id: "[id]",
                            userdata: "userdata",
                            subgrid: {
                                root: "rows",
                                row: "row",
                                repeatitems: true,
                                cell: "cell"
                            }
                        },
                        a.p.xmlReader);
                        a.p.jsonReader = b.extend(true, {
                            root: "rows",
                            page: "page",
                            total: "total",
                            records: "records",
                            repeatitems: true,
                            cell: "cell",
                            id: "id",
                            userdata: "userdata",
                            subgrid: {
                                root: "rows",
                                repeatitems: true,
                                cell: "cell"
                            }
                        },
                        a.p.jsonReader);
                        a.p.localReader = b.extend(true, {
                            root: "rows",
                            page: "page",
                            total: "total",
                            records: "records",
                            repeatitems: false,
                            cell: "cell",
                            id: "id",
                            userdata: "userdata",
                            subgrid: {
                                root: "rows",
                                repeatitems: true,
                                cell: "cell"
                            }
                        },
                        a.p.localReader);
                        if (a.p.scroll) {
                            a.p.pgbuttons = false;
                            a.p.pginput = false;
                            a.p.rowList = []
                        }
                        a.p.data.length && ca();
                        var da = "<thead><tr class='ui-jqgrid-labels' role='rowheader'>",
                        Ga, na, ta, ra, ua, Y, Q, oa;
                        na = oa = "";
                        if (a.p.shrinkToFit === true && a.p.forceFit === true) for (k = a.p.colModel.length - 1; k >= 0; k--) if (!a.p.colModel[k].hidden) {
                            a.p.colModel[k].resizable = false;
                            break
                        }
                        if (a.p.viewsortcols[1] == "horizontal") {
                            oa = " ui-i-asc";
                            na = " ui-i-desc"
                        }
                        Ga = y ? "class='ui-th-div-ie'": "";
                        oa = "<span class='s-ico' style='display:none'><span sort='asc' class='ui-grid-ico-sort ui-icon-asc" + oa + " ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-" + l + "'></span>";
                        oa += "<span sort='desc' class='ui-grid-ico-sort ui-icon-desc" + na + " ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-" + l + "'></span></span>";
                        for (k = 0; k < this.p.colNames.length; k++) {
                            na = a.p.headertitles ? ' title="' + b.jgrid.stripHtml(a.p.colNames[k]) + '"': "";
                            da += "<th id='" + a.p.id + "_" + a.p.colModel[k].name + "' role='columnheader' class='ui-state-default ui-th-column ui-th-" + l + "'" + na + ">";
                            na = a.p.colModel[k].index || a.p.colModel[k].name;
                            da += "<div id='jqgh_" + a.p.id + "_" + a.p.colModel[k].name + "' " + Ga + ">" + a.p.colNames[k];
                            a.p.colModel[k].width = a.p.colModel[k].width ? parseInt(a.p.colModel[k].width, 10) : 150;
                            if (typeof a.p.colModel[k].title !== "boolean") a.p.colModel[k].title = true;
                            if (na == a.p.sortname) a.p.lastsort = k;
                            da += oa + "</div></th>"
                        }
                        da += "</tr></thead>";
                        oa = null;
                        b(this).append(da);
                        b("thead tr:first th", this).hover(function() {
                            b(this).addClass("ui-state-hover")
                        },
                        function() {
                            b(this).removeClass("ui-state-hover")
                        });
                        if (this.p.multiselect) {
                            var Aa = [],
                            va;
                            b("#cb_" + b.jgrid.jqID(a.p.id), this).bind("click",
                            function() {
                                a.p.selarrrow = [];
                                var e = a.p.frozenColumns === true ? a.p.id + "_frozen": "";
                                if (this.checked) {
                                    b(a.rows).each(function(f) {
                                        if (f > 0) if (!b(this).hasClass("ui-subgrid") && !b(this).hasClass("jqgroup") && !b(this).hasClass("ui-state-disabled")) {
                                            b("#jqg_" + b.jgrid.jqID(a.p.id) + "_" + b.jgrid.jqID(this.id))[a.p.useProp ? "prop": "attr"]("checked", true);
                                            b(this).addClass("ui-state-highlight").attr("aria-selected", "true");
                                            a.p.selarrrow.push(this.id);
                                            a.p.selrow = this.id;
                                            if (e) {
                                                b("#jqg_" + b.jgrid.jqID(a.p.id) + "_" + b.jgrid.jqID(this.id), a.grid.fbDiv)[a.p.useProp ? "prop": "attr"]("checked", true);
                                                b("#" + b.jgrid.jqID(this.id), a.grid.fbDiv).addClass("ui-state-highlight")
                                            }
                                        }
                                    });
                                    va = true;
                                    Aa = []
                                } else {
                                    b(a.rows).each(function(f) {
                                        if (f > 0) if (!b(this).hasClass("ui-subgrid") && !b(this).hasClass("ui-state-disabled")) {
                                            b("#jqg_" + b.jgrid.jqID(a.p.id) + "_" + b.jgrid.jqID(this.id))[a.p.useProp ? "prop": "attr"]("checked", false);
                                            b(this).removeClass("ui-state-highlight").attr("aria-selected", "false");
                                            Aa.push(this.id);
                                            if (e) {
                                                b("#jqg_" + b.jgrid.jqID(a.p.id) + "_" + b.jgrid.jqID(this.id), a.grid.fbDiv)[a.p.useProp ? "prop": "attr"]("checked", false);
                                                b("#" + b.jgrid.jqID(this.id), a.grid.fbDiv).removeClass("ui-state-highlight")
                                            }
                                        }
                                    });
                                    a.p.selrow = null;
                                    va = false
                                }
                                if (b.isFunction(a.p.onSelectAll)) a.p.onSelectAll.call(a, va ? a.p.selarrrow: Aa, va)
                            })
                        }
                        if (a.p.autowidth === true) {
                            da = b(I).innerWidth();
                            a.p.width = da > 0 ? da: "nw"
                        } (function() {
                            var e = 0,
                            f = E ? 0 : a.p.cellLayout,
                            j = 0,
                            m,
                            p = a.p.scrollOffset,
                            C,
                            s = false,
                            A,
                            z = 0,
                            u = 0,
                            w;
                            b.each(a.p.colModel,
                            function() {
                                if (typeof this.hidden === "undefined") this.hidden = false;
                                this.widthOrg = C = M(this.width, 0);
                                if (this.hidden === false) {
                                    e += C + f;
                                    if (this.fixed) z += C + f;
                                    else j++;
                                    u++
                                }
                            });
                            if (isNaN(a.p.width)) a.p.width = h.width = e;
                            else h.width = a.p.width;
                            a.p.tblwidth = e;
                            if (a.p.shrinkToFit === false && a.p.forceFit === true) a.p.forceFit = false;
                            if (a.p.shrinkToFit === true && j > 0) {
                                A = h.width - f * j - z;
                                if (!isNaN(a.p.height)) {
                                    A -= p;
                                    s = true
                                }
                                e = 0;
                                b.each(a.p.colModel,
                                function(r) {
                                    if (this.hidden === false && !this.fixed) {
                                        this.width = C = Math.round(A * this.width / (a.p.tblwidth - f * j - z));
                                        e += C;
                                        m = r
                                    }
                                });
                                w = 0;
                                if (s) {
                                    if (h.width - z - (e + f * j) !== p) w = h.width - z - (e + f * j) - p
                                } else if (!s && Math.abs(h.width - z - (e + f * j)) !== 1) w = h.width - z - (e + f * j);
                                a.p.colModel[m].width += w;
                                a.p.tblwidth = e + w + f * j + z;
                                if (a.p.tblwidth > a.p.width) {
                                    a.p.colModel[m].width -= a.p.tblwidth - parseInt(a.p.width, 10);
                                    a.p.tblwidth = a.p.width
                                }
                            }
                        })();
                        b(I).css("width", h.width + "px").append("<div class='ui-jqgrid-resize-mark' id='rs_m" + a.p.id + "'>&#160;</div>");
                        b(q).css("width", h.width + "px");
                        da = b("thead:first", a).get(0);
                        var wa = "";
                        if (a.p.footerrow) wa += "<table role='grid' style='width:" + a.p.tblwidth + "px' class='ui-jqgrid-ftable' cellspacing='0' cellpadding='0' border='0'><tbody><tr role='row' class='ui-widget-content footrow footrow-" + l + "'>";
                        q = b("tr:first", da);
                        var xa = "<tr class='jqgfirstrow' role='row' style='height:auto'>";
                        a.p.disableClick = false;
                        b("th", q).each(function(e) {
                            ta = a.p.colModel[e].width;
                            if (typeof a.p.colModel[e].resizable === "undefined") a.p.colModel[e].resizable = true;
                            if (a.p.colModel[e].resizable) {
                                ra = document.createElement("span");
                                b(ra).html("&#160;").addClass("ui-jqgrid-resize ui-jqgrid-resize-" + l);
                                b.browser.opera || b(ra).css("cursor", "col-resize");
                                b(this).addClass(a.p.resizeclass)
                            } else ra = "";
                            b(this).css("width", ta + "px").prepend(ra);
                            var f = "";
                            if (a.p.colModel[e].hidden) {
                                b(this).css("display", "none");
                                f = "display:none;"
                            }
                            xa += "<td role='gridcell' style='height:0px;width:" + ta + "px;" + f + "'></td>";
                            h.headers[e] = {
                                width: ta,
                                el: this
                            };
                            ua = a.p.colModel[e].sortable;
                            if (typeof ua !== "boolean") ua = a.p.colModel[e].sortable = true;
                            f = a.p.colModel[e].name;
                            f == "cb" || f == "subgrid" || f == "rn" || a.p.viewsortcols[2] && b(">div", this).addClass("ui-jqgrid-sortable");
                            if (ua) if (a.p.viewsortcols[0]) {
                                b("div span.s-ico", this).show();
                                e == a.p.lastsort && b("div span.ui-icon-" + a.p.sortorder, this).removeClass("ui-state-disabled")
                            } else if (e == a.p.lastsort) {
                                b("div span.s-ico", this).show();
                                b("div span.ui-icon-" + a.p.sortorder, this).removeClass("ui-state-disabled")
                            }
                            if (a.p.footerrow) wa += "<td role='gridcell' " + N(e, 0, "", null, "", false) + ">&#160;</td>"
                        }).mousedown(function(e) {
                            if (b(e.target).closest("th>span.ui-jqgrid-resize").length == 1) {
                                var f = Fa(this);
                                if (a.p.forceFit === true) {
                                    var j = a.p,
                                    m = f,
                                    p;
                                    for (p = f + 1; p < a.p.colModel.length; p++) if (a.p.colModel[p].hidden !== true) {
                                        m = p;
                                        break
                                    }
                                    j.nv = m - f
                                }
                                h.dragStart(f, e, Ia(f));
                                return false
                            }
                        }).click(function(e) {
                            if (a.p.disableClick) return a.p.disableClick = false;
                            var f = "th>div.ui-jqgrid-sortable",
                            j, m;
                            a.p.viewsortcols[2] || (f = "th>div>span>span.ui-grid-ico-sort");
                            e = b(e.target).closest(f);
                            if (e.length == 1) {
                                f = Fa(this);
                                if (!a.p.viewsortcols[2]) {
                                    j = true;
                                    m = e.attr("sort")
                                }
                                Ea(b("div", this)[0].id, f, j, m);
                                return false
                            }
                        });
                        if (a.p.sortable && b.fn.sortable) try {
                            b(a).jqGrid("sortableColumns", q)
                        } catch(Oa) {}
                        if (a.p.footerrow) wa += "</tr></tbody></table>";
                        xa += "</tr>";
                        this.appendChild(document.createElement("tbody"));
                        b(this).addClass("ui-jqgrid-btable").append(xa);
                        xa = null;
                        q = b("<table class='ui-jqgrid-htable' style='width:" + a.p.tblwidth + "px' role='grid' aria-labelledby='gbox_" + this.id + "' cellspacing='0' cellpadding='0' border='0'></table>").append(da);
                        var ea = a.p.caption && a.p.hiddengrid === true ? true: false;
                        k = b("<div class='ui-jqgrid-hbox" + (l == "rtl" ? "-rtl": "") + "'></div>");
                        da = null;
                        h.hDiv = document.createElement("div");
                        b(h.hDiv).css({
                            width: h.width + "px"
                        }).addClass("ui-state-default ui-jqgrid-hdiv").append(k);
                        b(k).append(q);
                        q = null;
                        ea && b(h.hDiv).hide();
                        if (a.p.pager) {
                            if (typeof a.p.pager == "string") {
                                if (a.p.pager.substr(0, 1) != "#") a.p.pager = "#" + a.p.pager
                            } else a.p.pager = "#" + b(a.p.pager).attr("id");
                            b(a.p.pager).css({
                                width: h.width + "px"
                            }).appendTo(I).addClass("ui-state-default ui-jqgrid-pager ui-corner-bottom");
                            ea && b(a.p.pager).hide();
                            x(a.p.pager, "")
                        }
                        a.p.cellEdit === false && a.p.hoverrows === true && b(a).bind("mouseover",
                        function(e) {
                            Q = b(e.target).closest("tr.jqgrow");
                            b(Q).attr("class") !== "ui-subgrid" && b(Q).addClass("ui-state-hover")
                        }).bind("mouseout",
                        function(e) {
                            Q = b(e.target).closest("tr.jqgrow");
                            b(Q).removeClass("ui-state-hover")
                        });
                        var la, ma;
                        b(a).before(h.hDiv).click(function(e) {
                            Y = e.target;
                            Q = b(Y, a.rows).closest("tr.jqgrow");
                            if (b(Q).length === 0 || Q[0].className.indexOf("ui-state-disabled") > -1 || b(Y, a).closest("table.ui-jqgrid-btable")[0].id.replace("_frozen", "") !== a.id) return this;
                            var f = b(Y).hasClass("cbox"),
                            j = true;
                            if (b.isFunction(a.p.beforeSelectRow)) j = a.p.beforeSelectRow.call(a, Q[0].id, e);
                            if (Y.tagName == "A" || (Y.tagName == "INPUT" || Y.tagName == "TEXTAREA" || Y.tagName == "OPTION" || Y.tagName == "SELECT") && !f) return this;
                            if (j === true) {
                                if (a.p.cellEdit === true) if (a.p.multiselect && f) b(a).jqGrid("setSelection", Q[0].id, true);
                                else {
                                    la = Q[0].rowIndex;
                                    ma = b.jgrid.getCellIndex(Y);
                                    try {
                                        b(a).jqGrid("editCell", la, ma, true)
                                    } catch(m) {}
                                } else if (a.p.multikey) if (e[a.p.multikey]) b(a).jqGrid("setSelection", Q[0].id, true);
                                else {
                                    if (a.p.multiselect && f) {
                                        f = b("#jqg_" + b.jgrid.jqID(a.p.id) + "_" + Q[0].id).is(":checked");
                                        b("#jqg_" + b.jgrid.jqID(a.p.id) + "_" + Q[0].id)[a.p.useProp ? "prop": "attr"]("checked", f)
                                    }
                                } else {
                                    if (a.p.multiselect && a.p.multiboxonly) if (!f) {
                                        var p = a.p.frozenColumns ? a.p.id + "_frozen": "";
                                        b(a.p.selarrrow).each(function(C, s) {
                                            var A = a.rows.namedItem(s);
                                            b(A).removeClass("ui-state-highlight");
                                            b("#jqg_" + b.jgrid.jqID(a.p.id) + "_" + b.jgrid.jqID(s))[a.p.useProp ? "prop": "attr"]("checked", false);
                                            if (p) {
                                                b("#" + b.jgrid.jqID(s), "#" + b.jgrid.jqID(p)).removeClass("ui-state-highlight");
                                                b("#jqg_" + b.jgrid.jqID(a.p.id) + "_" + b.jgrid.jqID(s), "#" + b.jgrid.jqID(p))[a.p.useProp ? "prop": "attr"]("checked", false)
                                            }
                                        });
                                        a.p.selarrrow = []
                                    }
                                    b(a).jqGrid("setSelection", Q[0].id, true)
                                }
                                if (b.isFunction(a.p.onCellSelect)) {
                                    la = Q[0].id;
                                    ma = b.jgrid.getCellIndex(Y);
                                    a.p.onCellSelect.call(a, la, ma, b(Y).html(), e)
                                }
                            }
                            return this
                        }).bind("reloadGrid",
                        function(e, f) {
                            if (a.p.treeGrid === true) a.p.datatype = a.p.treedatatype;
                            f && f.current && a.grid.selectionPreserver(a);
                            if (a.p.datatype == "local") {
                                b(a).jqGrid("resetSelection");
                                a.p.data.length && ca()
                            } else if (!a.p.treeGrid) {
                                a.p.selrow = null;
                                if (a.p.multiselect) {
                                    a.p.selarrrow = [];
                                    sa(false)
                                }
                                a.p.savedRow = []
                            }
                            a.p.scroll && D(a.grid.bDiv, true, false);
                            if (f && f.page) {
                                var j = f.page;
                                if (j > a.p.lastpage) j = a.p.lastpage;
                                if (j < 1) j = 1;
                                a.p.page = j;
                                a.grid.bDiv.scrollTop = a.grid.prevRowHeight ? (j - 1) * a.grid.prevRowHeight * a.p.rowNum: 0
                            }
                            if (a.grid.prevRowHeight && a.p.scroll) {
                                delete a.p.lastpage;
                                a.grid.populateVisible()
                            } else a.grid.populate();
                            return false
                        });
                        b.isFunction(this.p.ondblClickRow) && b(this).dblclick(function(e) {
                            Y = e.target;
                            Q = b(Y, a.rows).closest("tr.jqgrow");
                            if (b(Q).length === 0) return false;
                            la = Q[0].rowIndex;
                            ma = b.jgrid.getCellIndex(Y);
                            a.p.ondblClickRow.call(a, b(Q).attr("id"), la, ma, e);
                            return false
                        });
                        b.isFunction(this.p.onRightClickRow) && b(this).bind("contextmenu",
                        function(e) {
                            Y = e.target;
                            Q = b(Y, a.rows).closest("tr.jqgrow");
                            if (b(Q).length === 0) return false;
                            a.p.multiselect || b(a).jqGrid("setSelection", Q[0].id, true);
                            la = Q[0].rowIndex;
                            ma = b.jgrid.getCellIndex(Y);
                            a.p.onRightClickRow.call(a, b(Q).attr("id"), la, ma, e);
                            return false
                        });
                        h.bDiv = document.createElement("div");
                        if (y) if (String(a.p.height).toLowerCase() === "auto") a.p.height = "100%";
                        b(h.bDiv).append(b('<div style="position:relative;' + (y && b.browser.version < 8 ? "height:0.01%;": "") + '"></div>').append("<div></div>").append(this)).addClass("ui-jqgrid-bdiv").css({
                            height: a.p.height + (isNaN(a.p.height) ? "": "px"),
                            width: h.width + "px"
                        }).scroll(h.scrollGrid);
                        b("table:first", h.bDiv).css({
                            width: a.p.tblwidth + "px"
                        });
                        if (y) {
                            b("tbody", this).size() == 2 && b("tbody:gt(0)", this).remove();
                            a.p.multikey && b(h.bDiv).bind("selectstart",
                            function() {
                                return false
                            })
                        } else a.p.multikey && b(h.bDiv).bind("mousedown",
                        function() {
                            return false
                        });
                        ea && b(h.bDiv).hide();
                        h.cDiv = document.createElement("div");
                        var Ba = a.p.hidegrid === true ? b("<a role='link' href='javascript:void(0)'/>").addClass("ui-jqgrid-titlebar-close HeaderButton").hover(function() {
                            Ba.addClass("ui-state-hover")
                        },
                        function() {
                            Ba.removeClass("ui-state-hover")
                        }).append("<span class='ui-icon ui-icon-circle-triangle-n'></span>").css(l == "rtl" ? "left": "right", "0px") : "";
                        b(h.cDiv).append(Ba).append("<span class='ui-jqgrid-title" + (l == "rtl" ? "-rtl": "") + "'>" + a.p.caption + "</span>").addClass("ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix");
                        b(h.cDiv).insertBefore(h.hDiv);
                        if (a.p.toolbar[0]) {
                            h.uDiv = document.createElement("div");
                            if (a.p.toolbar[1] == "top") b(h.uDiv).insertBefore(h.hDiv);
                            else a.p.toolbar[1] == "bottom" && b(h.uDiv).insertAfter(h.hDiv);
                            if (a.p.toolbar[1] == "both") {
                                h.ubDiv = document.createElement("div");
                                b(h.uDiv).insertBefore(h.hDiv).addClass("ui-userdata ui-state-default").attr("id", "t_" + this.id);
                                b(h.ubDiv).insertAfter(h.hDiv).addClass("ui-userdata ui-state-default").attr("id", "tb_" + this.id);
                                ea && b(h.ubDiv).hide()
                            } else b(h.uDiv).width(h.width).addClass("ui-userdata ui-state-default").attr("id", "t_" + this.id);
                            ea && b(h.uDiv).hide()
                        }
                        if (a.p.toppager) {
                            a.p.toppager = b.jgrid.jqID(a.p.id) + "_toppager";
                            h.topDiv = b("<div id='" + a.p.toppager + "'></div>")[0];
                            a.p.toppager = "#" + a.p.toppager;
                            b(h.topDiv).insertBefore(h.hDiv).addClass("ui-state-default ui-jqgrid-toppager").width(h.width);
                            x(a.p.toppager, "_t")
                        }
                        if (a.p.footerrow) {
                            h.sDiv = b("<div class='ui-jqgrid-sdiv'></div>")[0];
                            k = b("<div class='ui-jqgrid-hbox" + (l == "rtl" ? "-rtl": "") + "'></div>");
                            b(h.sDiv).append(k).insertAfter(h.hDiv).width(h.width);
                            b(k).append(wa);
                            h.footers = b(".ui-jqgrid-ftable", h.sDiv)[0].rows[0].cells;
                            if (a.p.rownumbers) h.footers[0].className = "ui-state-default jqgrid-rownum";
                            ea && b(h.sDiv).hide()
                        }
                        k = null;
                        if (a.p.caption) {
                            var Ja = a.p.datatype;
                            if (a.p.hidegrid === true) {
                                b(".ui-jqgrid-titlebar-close", h.cDiv).click(function(e) {
                                    var f = b.isFunction(a.p.onHeaderClick),
                                    j = ".ui-jqgrid-bdiv, .ui-jqgrid-hdiv, .ui-jqgrid-pager, .ui-jqgrid-sdiv",
                                    m,
                                    p = this;
                                    if (a.p.toolbar[0] === true) {
                                        if (a.p.toolbar[1] == "both") j += ", #" + b(h.ubDiv).attr("id");
                                        j += ", #" + b(h.uDiv).attr("id")
                                    }
                                    m = b(j, "#gview_" + b.jgrid.jqID(a.p.id)).length;
                                    if (a.p.gridstate == "visible") b(j, "#gbox_" + b.jgrid.jqID(a.p.id)).slideUp("fast",
                                    function() {
                                        m--;
                                        if (m === 0) {
                                            b("span", p).removeClass("ui-icon-circle-triangle-n").addClass("ui-icon-circle-triangle-s");
                                            a.p.gridstate = "hidden";
                                            b("#gbox_" + b.jgrid.jqID(a.p.id)).hasClass("ui-resizable") && b(".ui-resizable-handle", "#gbox_" + b.jgrid.jqID(a.p.id)).hide();
                                            if (f) ea || a.p.onHeaderClick.call(a, a.p.gridstate, e)
                                        }
                                    });
                                    else a.p.gridstate == "hidden" && b(j, "#gbox_" + b.jgrid.jqID(a.p.id)).slideDown("fast",
                                    function() {
                                        m--;
                                        if (m === 0) {
                                            b("span", p).removeClass("ui-icon-circle-triangle-s").addClass("ui-icon-circle-triangle-n");
                                            if (ea) {
                                                a.p.datatype = Ja;
                                                ka();
                                                ea = false
                                            }
                                            a.p.gridstate = "visible";
                                            b("#gbox_" + b.jgrid.jqID(a.p.id)).hasClass("ui-resizable") && b(".ui-resizable-handle", "#gbox_" + b.jgrid.jqID(a.p.id)).show();
                                            if (f) ea || a.p.onHeaderClick.call(a, a.p.gridstate, e)
                                        }
                                    });
                                    return false
                                });
                                if (ea) {
                                    a.p.datatype = "local";
                                    b(".ui-jqgrid-titlebar-close", h.cDiv).trigger("click")
                                }
                            }
                        } else b(h.cDiv).hide();
                        b(h.hDiv).after(h.bDiv).mousemove(function(e) {
                            if (h.resizing) {
                                h.dragMove(e);
                                return false
                            }
                        });
                        b(".ui-jqgrid-labels", h.hDiv).bind("selectstart",
                        function() {
                            return false
                        });
                        b(document).mouseup(function() {
                            if (h.resizing) {
                                h.dragEnd();
                                return false
                            }
                            return true
                        });
                        a.formatCol = N;
                        a.sortData = Ea;
                        a.updatepager = function(e, f) {
                            var j, m, p, C, s, A, z, u = "",
                            w = a.p.pager ? "_" + b.jgrid.jqID(a.p.pager.substr(1)) : "",
                            r = a.p.toppager ? "_" + a.p.toppager.substr(1) : "";
                            p = parseInt(a.p.page, 10) - 1;
                            if (p < 0) p = 0;
                            p *= parseInt(a.p.rowNum, 10);
                            s = p + a.p.reccount;
                            if (a.p.scroll) {
                                j = b("tbody:first > tr:gt(0)", a.grid.bDiv);
                                p = s - j.length;
                                a.p.reccount = j.length;
                                if (m = j.outerHeight() || a.grid.prevRowHeight) {
                                    j = p * m;
                                    m *= parseInt(a.p.records, 10);
                                    b(">div:first", a.grid.bDiv).css({
                                        height: m
                                    }).children("div:first").css({
                                        height: j,
                                        display: j ? "": "none"
                                    })
                                }
                                a.grid.bDiv.scrollLeft = a.grid.hDiv.scrollLeft
                            }
                            u = a.p.pager ? a.p.pager: "";
                            u += a.p.toppager ? u ? "," + a.p.toppager: a.p.toppager: "";
                            if (u) {
                                z = b.jgrid.formatter.integer || {};
                                j = M(a.p.page);
                                m = M(a.p.lastpage);
                                b(".selbox", u)[this.p.useProp ? "prop": "attr"]("disabled", false);
                                if (a.p.pginput === true) {
                                    b(".ui-pg-input", u).val(a.p.page);
                                    C = a.p.toppager ? "#sp_1" + w + ",#sp_1" + r: "#sp_1" + w;
                                    b(C).html(b.fmatter ? b.fmatter.util.NumberFormat(a.p.lastpage, z) : a.p.lastpage)
                                }
                                if (a.p.viewrecords) if (a.p.reccount === 0) b(".ui-paging-info", u).html(a.p.emptyrecords);
                                else {
                                    C = p + 1;
                                    A = a.p.records;
                                    if (b.fmatter) {
                                        C = b.fmatter.util.NumberFormat(C, z);
                                        s = b.fmatter.util.NumberFormat(s, z);
                                        A = b.fmatter.util.NumberFormat(A, z)
                                    }
                                    b(".ui-paging-info", u).html(b.jgrid.format(a.p.recordtext, C, s, A))
                                }
                                if (a.p.pgbuttons === true) {
                                    if (j <= 0) j = m = 0;
                                    if (j == 1 || j === 0) {
                                        b("#first" + w + ", #prev" + w).addClass("ui-state-disabled").removeClass("ui-state-hover");
                                        a.p.toppager && b("#first_t" + r + ", #prev_t" + r).addClass("ui-state-disabled").removeClass("ui-state-hover")
                                    } else {
                                        b("#first" + w + ", #prev" + w).removeClass("ui-state-disabled");
                                        a.p.toppager && b("#first_t" + r + ", #prev_t" + r).removeClass("ui-state-disabled")
                                    }
                                    if (j == m || j === 0) {
                                        b("#next" + w + ", #last" + w).addClass("ui-state-disabled").removeClass("ui-state-hover");
                                        a.p.toppager && b("#next_t" + r + ", #last_t" + r).addClass("ui-state-disabled").removeClass("ui-state-hover")
                                    } else {
                                        b("#next" + w + ", #last" + w).removeClass("ui-state-disabled");
                                        a.p.toppager && b("#next_t" + r + ", #last_t" + r).removeClass("ui-state-disabled")
                                    }
                                }
                            }
                            e === true && a.p.rownumbers === true && b("td.jqgrid-rownum", a.rows).each(function(G) {
                                b(this).html(p + 1 + G)
                            });
                            f && a.p.jqgdnd && b(a).jqGrid("gridDnD", "updateDnD");
                            b.isFunction(a.p.gridComplete) && a.p.gridComplete.call(a);
                            b.isFunction(a.p._complete) && a.p._complete.call(a)
                        };
                        a.refreshIndex = ca;
                        a.setHeadCheckBox = sa;
                        a.formatter = function(e, f, j, m, p) {
                            return o(e, f, j, m, p)
                        };
                        b.extend(h, {
                            populate: ka,
                            emptyRows: D
                        });
                        this.grid = h;
                        a.addXmlData = function(e) {
                            X(e, a.grid.bDiv)
                        };
                        a.addJSONData = function(e) {
                            fa(e, a.grid.bDiv)
                        };
                        this.grid.cols = this.rows[0].cells;
                        ka();
                        a.p.hiddengrid = false;
                        b(window).unload(function() {
                            a = null
                        })
                    }
                }
            }
        })
    };
    b.jgrid.extend({
        getGridParam: function(d) {
            var i = this[0];
            if (i && i.grid) return d ? typeof i.p[d] != "undefined" ? i.p[d] : null: i.p
        },
        setGridParam: function(d) {
            return this.each(function() {
                this.grid && typeof d === "object" && b.extend(true, this.p, d)
            })
        },
        getDataIDs: function() {
            var d = [],
            i = 0,
            g,
            c = 0;
            this.each(function() {
                if ((g = this.rows.length) && g > 0) for (; i < g;) {
                    if (b(this.rows[i]).hasClass("jqgrow")) {
                        d[c] = this.rows[i].id;
                        c++
                    }
                    i++
                }
            });
            return d
        },
        setSelection: function(d, i) {
            return this.each(function() {
                function g(x) {
                    var y = b(c.grid.bDiv)[0].clientHeight,
                    E = b(c.grid.bDiv)[0].scrollTop,
                    I = c.rows[x].offsetTop;
                    x = c.rows[x].clientHeight;
                    if (I + x >= y + E) b(c.grid.bDiv)[0].scrollTop = I - (y + E) + x + E;
                    else if (I < y + E) if (I < E) b(c.grid.bDiv)[0].scrollTop = I
                }
                var c = this,
                h, k, l, a, q;
                if (d !== undefined) {
                    i = i === false ? false: true;
                    k = c.rows.namedItem(d + "");
                    if (! (!k || !k.className || k.className.indexOf("ui-state-disabled") > -1)) {
                        if (c.p.scrollrows === true) {
                            h = c.rows.namedItem(d).rowIndex;
                            h >= 0 && g(h)
                        }
                        if (c.p.frozenColumns === true) q = c.p.id + "_frozen";
                        if (c.p.multiselect) {
                            c.setHeadCheckBox(false);
                            c.p.selrow = k.id;
                            l = b.inArray(c.p.selrow, c.p.selarrrow);
                            if (l === -1) {
                                k.className !== "ui-subgrid" && b(k).addClass("ui-state-highlight").attr("aria-selected", "true");
                                h = true;
                                b("#jqg_" + b.jgrid.jqID(c.p.id) + "_" + b.jgrid.jqID(c.p.selrow))[c.p.useProp ? "prop": "attr"]("checked", h);
                                c.p.selarrrow.push(c.p.selrow)
                            } else {
                                k.className !== "ui-subgrid" && b(k).removeClass("ui-state-highlight").attr("aria-selected", "false");
                                h = false;
                                b("#jqg_" + b.jgrid.jqID(c.p.id) + "_" + b.jgrid.jqID(c.p.selrow))[c.p.useProp ? "prop": "attr"]("checked", h);
                                c.p.selarrrow.splice(l, 1);
                                a = c.p.selarrrow[0];
                                c.p.selrow = a === undefined ? null: a
                            }
                            if (q) {
                                l === -1 ? b("#" + b.jgrid.jqID(d), "#" + b.jgrid.jqID(q)).addClass("ui-state-highlight") : b("#" + b.jgrid.jqID(d), "#" + b.jgrid.jqID(q)).removeClass("ui-state-highlight");
                                b("#jqg_" + b.jgrid.jqID(c.p.id) + "_" + b.jgrid.jqID(d), "#" + b.jgrid.jqID(q))[c.p.useProp ? "prop": "attr"]("checked", h)
                            }
                            c.p.onSelectRow && i && c.p.onSelectRow.call(c, k.id, h)
                        } else if (k.className !== "ui-subgrid") {
                            if (c.p.selrow != k.id) {
                                b(c.rows.namedItem(c.p.selrow)).removeClass("ui-state-highlight").attr({
                                    "aria-selected": "false",
                                    tabindex: "-1"
                                });
                                b(k).addClass("ui-state-highlight").attr({
                                    "aria-selected": "true",
                                    tabindex: "0"
                                });
                                if (q) {
                                    b("#" + b.jgrid.jqID(c.p.selrow), "#" + b.jgrid.jqID(q)).removeClass("ui-state-highlight");
                                    b("#" + b.jgrid.jqID(d), "#" + b.jgrid.jqID(q)).addClass("ui-state-highlight")
                                }
                                h = true
                            } else h = false;
                            c.p.selrow = k.id;
                            c.p.onSelectRow && i && c.p.onSelectRow.call(c, k.id, h)
                        }
                    }
                }
            })
        },
        resetSelection: function(d) {
            return this.each(function() {
                var i = this,
                g, c;
                if (typeof d !== "undefined") {
                    c = d === i.p.selrow ? i.p.selrow: d;
                    b("#" + b.jgrid.jqID(i.p.id) + " tbody:first tr#" + b.jgrid.jqID(c)).removeClass("ui-state-highlight").attr("aria-selected", "false");
                    if (i.p.multiselect) {
                        b("#jqg_" + b.jgrid.jqID(i.p.id) + "_" + b.jgrid.jqID(c))[i.p.useProp ? "prop": "attr"]("checked", false);
                        i.setHeadCheckBox(false)
                    }
                    c = null
                } else if (i.p.multiselect) {
                    b(i.p.selarrrow).each(function(h, k) {
                        g = i.rows.namedItem(k);
                        b(g).removeClass("ui-state-highlight").attr("aria-selected", "false");
                        b("#jqg_" + b.jgrid.jqID(i.p.id) + "_" + b.jgrid.jqID(k))[i.p.useProp ? "prop": "attr"]("checked", false)
                    });
                    i.setHeadCheckBox(false);
                    i.p.selarrrow = []
                } else if (i.p.selrow) {
                    b("#" + b.jgrid.jqID(i.p.id) + " tbody:first tr#" + b.jgrid.jqID(i.p.selrow)).removeClass("ui-state-highlight").attr("aria-selected", "false");
                    i.p.selrow = null
                }
                if (i.p.cellEdit === true) if (parseInt(i.p.iCol, 10) >= 0 && parseInt(i.p.iRow, 10) >= 0) {
                    b("td:eq(" + i.p.iCol + ")", i.rows[i.p.iRow]).removeClass("edit-cell ui-state-highlight");
                    b(i.rows[i.p.iRow]).removeClass("selected-row ui-state-hover")
                }
                i.p.savedRow = []
            })
        },
        getRowData: function(d) {
            var i = {},
            g, c = false,
            h, k = 0;
            this.each(function() {
                var l = this,
                a, q;
                if (typeof d == "undefined") {
                    c = true;
                    g = [];
                    h = l.rows.length
                } else {
                    q = l.rows.namedItem(d);
                    if (!q) return i;
                    h = 2
                }
                for (; k < h;) {
                    if (c) q = l.rows[k];
                    if (b(q).hasClass("jqgrow")) {
                        b("td", q).each(function(x) {
                            a = l.p.colModel[x].name;
                            if (a !== "cb" && a !== "subgrid" && a !== "rn") if (l.p.treeGrid === true && a == l.p.ExpandColumn) i[a] = b.jgrid.htmlDecode(b("span:first", this).html());
                            else try {
                                i[a] = b.unformat(this, {
                                    rowId: q.id,
                                    colModel: l.p.colModel[x]
                                },
                                x)
                            } catch(y) {
                                i[a] = b.jgrid.htmlDecode(b(this).html())
                            }
                        });
                        if (c) {
                            g.push(i);
                            i = {}
                        }
                    }
                    k++
                }
            });
            return g ? g: i
        },
        delRowData: function(d) {
            var i = false,
            g, c;
            this.each(function() {
                if (g = this.rows.namedItem(d)) {
                    b(g).remove();
                    this.p.records--;
                    this.p.reccount--;
                    this.updatepager(true, false);
                    i = true;
                    if (this.p.multiselect) {
                        c = b.inArray(d, this.p.selarrrow);
                        c != -1 && this.p.selarrrow.splice(c, 1)
                    }
                    if (d == this.p.selrow) this.p.selrow = null
                } else return false;
                if (this.p.datatype == "local") {
                    var h = this.p._index[d];
                    if (typeof h != "undefined") {
                        this.p.data.splice(h, 1);
                        this.refreshIndex()
                    }
                }
                if (this.p.altRows === true && i) {
                    var k = this.p.altclass;
                    b(this.rows).each(function(l) {
                        l % 2 == 1 ? b(this).addClass(k) : b(this).removeClass(k)
                    })
                }
            });
            return i
        },
        setRowData: function(d, i, g) {
            var c, h = true,
            k;
            this.each(function() {
                if (!this.grid) return false;
                var l = this,
                a, q, x = typeof g,
                y = {};
                q = l.rows.namedItem(d);
                if (!q) return false;
                if (i) try {
                    b(this.p.colModel).each(function(N) {
                        c = this.name;
                        if (i[c] !== undefined) {
                            y[c] = this.formatter && typeof this.formatter === "string" && this.formatter == "date" ? b.unformat.date(i[c], this) : i[c];
                            a = l.formatter(d, i[c], N, i, "edit");
                            k = this.title ? {
                                title: b.jgrid.stripHtml(a)
                            }: {};
                            l.p.treeGrid === true && c == l.p.ExpandColumn ? b("td:eq(" + N + ") > span:first", q).html(a).attr(k) : b("td:eq(" + N + ")", q).html(a).attr(k)
                        }
                    });
                    if (l.p.datatype == "local") {
                        var E = l.p._index[d];
                        if (l.p.treeGrid) for (var I in l.p.treeReader) y.hasOwnProperty(l.p.treeReader[I]) && delete y[l.p.treeReader[I]];
                        if (typeof E != "undefined") l.p.data[E] = b.extend(true, l.p.data[E], y);
                        y = null
                    }
                } catch(M) {
                    h = false
                }
                if (h) {
                    if (x === "string") b(q).addClass(g);
                    else x === "object" && b(q).css(g);
                    b.isFunction(l.p._complete) && l.p._complete.call(l)
                }
            });
            return h
        },
        addRowData: function(d, i, g, c) {
            g || (g = "last");
            var h = false,
            k, l, a, q, x, y, E, I, M = "",
            N, V, o, n, t;
            if (i) {
                if (b.isArray(i)) {
                    N = true;
                    g = "last";
                    V = d
                } else {
                    i = [i];
                    N = false
                }
                this.each(function() {
                    var F = i.length;
                    x = this.p.rownumbers === true ? 1 : 0;
                    a = this.p.multiselect === true ? 1 : 0;
                    q = this.p.subGrid === true ? 1 : 0;
                    if (!N) if (typeof d != "undefined") d += "";
                    else {
                        d = b.jgrid.randId();
                        if (this.p.keyIndex !== false) {
                            V = this.p.colModel[this.p.keyIndex + a + q + x].name;
                            if (typeof i[0][V] != "undefined") d = i[0][V]
                        }
                    }
                    o = this.p.altclass;
                    for (var T = 0,
                    J = "",
                    D = {},
                    ca = b.isFunction(this.p.afterInsertRow) ? true: false; T < F;) {
                        n = i[T];
                        l = "";
                        if (N) {
                            try {
                                d = n[V]
                            } catch(X) {
                                d = b.jgrid.randId()
                            }
                            J = this.p.altRows === true ? (this.rows.length - 1) % 2 === 0 ? o: "": ""
                        }
                        d = this.p.idPrefix + d;
                        if (x) {
                            M = this.formatCol(0, 1, "", null, d, true);
                            l += '<td role="gridcell" aria-describedby="' + this.p.id + '_rn" class="ui-state-default jqgrid-rownum" ' + M + ">0</td>"
                        }
                        if (a) {
                            I = '<input role="checkbox" type="checkbox" id="jqg_' + this.p.id + "_" + d + '" class="cbox"/>';
                            M = this.formatCol(x, 1, "", null, d, true);
                            l += '<td role="gridcell" aria-describedby="' + this.p.id + '_cb" ' + M + ">" + I + "</td>"
                        }
                        if (q) l += b(this).jqGrid("addSubGridCell", a + x, 1);
                        for (E = a + q + x; E < this.p.colModel.length; E++) {
                            t = this.p.colModel[E];
                            k = t.name;
                            D[k] = t.formatter && typeof t.formatter === "string" && t.formatter == "date" ? b.unformat.date(n[k], t) : n[k];
                            I = this.formatter(d, b.jgrid.getAccessor(n, k), E, n, "edit");
                            M = this.formatCol(E, 1, I, n, d, true);
                            l += '<td role="gridcell" aria-describedby="' + this.p.id + "_" + k + '" ' + M + ">" + I + "</td>"
                        }
                        l = '<tr id="' + d + '" role="row" tabindex="-1" class="ui-widget-content jqgrow ui-row-' + this.p.direction + " " + J + '">' + l + "</tr>";
                        if (this.rows.length === 0) b("table:first", this.grid.bDiv).append(l);
                        else switch (g) {
                        case "last":
                            b(this.rows[this.rows.length - 1]).after(l);
                            y = this.rows.length - 1;
                            break;
                        case "first":
                            b(this.rows[0]).after(l);
                            y = 1;
                            break;
                        case "after":
                            if (y = this.rows.namedItem(c)) b(this.rows[y.rowIndex + 1]).hasClass("ui-subgrid") ? b(this.rows[y.rowIndex + 1]).after(l) : b(y).after(l);
                            y++;
                            break;
                        case "before":
                            if (y = this.rows.namedItem(c)) {
                                b(y).before(l);
                                y = y.rowIndex
                            }
                            y--
                        }
                        this.p.subGrid === true && b(this).jqGrid("addSubGrid", a + x, y);
                        this.p.records++;
                        this.p.reccount++;
                        ca && this.p.afterInsertRow.call(this, d, n, n);
                        T++;
                        if (this.p.datatype == "local") {
                            D[this.p.localReader.id] = d;
                            this.p._index[d] = this.p.data.length;
                            this.p.data.push(D);
                            D = {}
                        }
                    }
                    if (this.p.altRows === true && !N) if (g == "last")(this.rows.length - 1) % 2 == 1 && b(this.rows[this.rows.length - 1]).addClass(o);
                    else b(this.rows).each(function(fa) {
                        fa % 2 == 1 ? b(this).addClass(o) : b(this).removeClass(o)
                    });
                    this.updatepager(true, true);
                    h = true
                })
            }
            return h
        },
        footerData: function(d, i, g) {
            function c(q) {
                for (var x in q) if (q.hasOwnProperty(x)) return false;
                return true
            }
            var h, k = false,
            l = {},
            a;
            if (typeof d == "undefined") d = "get";
            if (typeof g != "boolean") g = true;
            d = d.toLowerCase();
            this.each(function() {
                var q = this,
                x;
                if (!q.grid || !q.p.footerrow) return false;
                if (d == "set") if (c(i)) return false;
                k = true;
                b(this.p.colModel).each(function(y) {
                    h = this.name;
                    if (d == "set") {
                        if (i[h] !== undefined) {
                            x = g ? q.formatter("", i[h], y, i, "edit") : i[h];
                            a = this.title ? {
                                title: b.jgrid.stripHtml(x)
                            }: {};
                            b("tr.footrow td:eq(" + y + ")", q.grid.sDiv).html(x).attr(a);
                            k = true
                        }
                    } else if (d == "get") l[h] = b("tr.footrow td:eq(" + y + ")", q.grid.sDiv).html()
                })
            });
            return d == "get" ? l: k
        },
        showHideCol: function(d, i) {
            return this.each(function() {
                var g = this,
                c = false,
                h = b.browser.webkit || b.browser.safari ? 0 : g.p.cellLayout,
                k;
                if (g.grid) {
                    if (typeof d === "string") d = [d];
                    i = i != "none" ? "": "none";
                    var l = i === "" ? true: false,
                    a = g.p.groupHeader && (typeof g.p.groupHeader === "object" || b.isFunction(g.p.groupHeader));
                    a && b(g).jqGrid("destroyGroupHeader", false);
                    b(this.p.colModel).each(function(q) {
                        if (b.inArray(this.name, d) !== -1 && this.hidden === l) {
                            if (g.p.frozenColumns === true && this.frozen === true) return true;
                            b("tr", g.grid.hDiv).each(function() {
                                b(this.cells[q]).css("display", i)
                            });
                            b(g.rows).each(function() {
                                b(this.cells[q]).css("display", i)
                            });
                            g.p.footerrow && b("tr.footrow td:eq(" + q + ")", g.grid.sDiv).css("display", i);
                            k = this.widthOrg ? this.widthOrg: parseInt(this.width, 10);
                            if (i === "none") g.p.tblwidth -= k + h;
                            else g.p.tblwidth += k + h;
                            this.hidden = !l;
                            c = true
                        }
                    });
                    if (c === true) b(g).jqGrid("setGridWidth", g.p.shrinkToFit === true ? g.p.tblwidth: g.p.width);
                    a && b(g).jqGrid("setGroupHeaders", g.p.groupHeader)
                }
            })
        },
        hideCol: function(d) {
            return this.each(function() {
                b(this).jqGrid("showHideCol", d, "none")
            })
        },
        showCol: function(d) {
            return this.each(function() {
                b(this).jqGrid("showHideCol", d, "")
            })
        },
        remapColumns: function(d, i, g) {
            function c(l) {
                var a;
                a = l.length ? b.makeArray(l) : b.extend({},
                l);
                b.each(d,
                function(q) {
                    l[q] = a[this]
                })
            }
            function h(l, a) {
                b(">tr" + (a || ""), l).each(function() {
                    var q = this,
                    x = b.makeArray(q.cells);
                    b.each(d,
                    function() {
                        var y = x[this];
                        y && q.appendChild(y)
                    })
                })
            }
            var k = this.get(0);
            c(k.p.colModel);
            c(k.p.colNames);
            c(k.grid.headers);
            h(b("thead:first", k.grid.hDiv), g && ":not(.ui-jqgrid-labels)");
            i && h(b("#" + b.jgrid.jqID(k.p.id) + " tbody:first"), ".jqgfirstrow, tr.jqgrow, tr.jqfoot");
            k.p.footerrow && h(b("tbody:first", k.grid.sDiv));
            if (k.p.remapColumns) if (k.p.remapColumns.length) c(k.p.remapColumns);
            else k.p.remapColumns = b.makeArray(d);
            k.p.lastsort = b.inArray(k.p.lastsort, d);
            if (k.p.treeGrid) k.p.expColInd = b.inArray(k.p.expColInd, d)
        },
        setGridWidth: function(d, i) {
            return this.each(function() {
                if (this.grid) {
                    var g = this,
                    c, h = 0,
                    k = b.browser.webkit || b.browser.safari ? 0 : g.p.cellLayout,
                    l,
                    a = 0,
                    q = false,
                    x = g.p.scrollOffset,
                    y,
                    E = 0,
                    I = 0,
                    M;
                    if (typeof i != "boolean") i = g.p.shrinkToFit;
                    if (!isNaN(d)) {
                        d = parseInt(d, 10);
                        g.grid.width = g.p.width = d;
                        b("#gbox_" + b.jgrid.jqID(g.p.id)).css("width", d + "px");
                        b("#gview_" + b.jgrid.jqID(g.p.id)).css("width", d + "px");
                        b(g.grid.bDiv).css("width", d + "px");
                        b(g.grid.hDiv).css("width", d + "px");
                        g.p.pager && b(g.p.pager).css("width", d + "px");
                        g.p.toppager && b(g.p.toppager).css("width", d + "px");
                        if (g.p.toolbar[0] === true) {
                            b(g.grid.uDiv).css("width", d + "px");
                            g.p.toolbar[1] == "both" && b(g.grid.ubDiv).css("width", d + "px")
                        }
                        g.p.footerrow && b(g.grid.sDiv).css("width", d + "px");
                        if (i === false && g.p.forceFit === true) g.p.forceFit = false;
                        if (i === true) {
                            b.each(g.p.colModel,
                            function() {
                                if (this.hidden === false) {
                                    c = this.widthOrg ? this.widthOrg: parseInt(this.width, 10);
                                    h += c + k;
                                    if (this.fixed) E += c + k;
                                    else a++;
                                    I++
                                }
                            });
                            if (a === 0) return;
                            g.p.tblwidth = h;
                            y = d - k * a - E;
                            if (!isNaN(g.p.height)) if (b(g.grid.bDiv)[0].clientHeight < b(g.grid.bDiv)[0].scrollHeight || g.rows.length === 1) {
                                q = true;
                                y -= x
                            }
                            h = 0;
                            var N = g.grid.cols.length > 0;
                            b.each(g.p.colModel,
                            function(V) {
                                if (this.hidden === false && !this.fixed) {
                                    c = this.widthOrg ? this.widthOrg: parseInt(this.width, 10);
                                    c = Math.round(y * c / (g.p.tblwidth - k * a - E));
                                    if (! (c < 0)) {
                                        this.width = c;
                                        h += c;
                                        g.grid.headers[V].width = c;
                                        g.grid.headers[V].el.style.width = c + "px";
                                        if (g.p.footerrow) g.grid.footers[V].style.width = c + "px";
                                        if (N) g.grid.cols[V].style.width = c + "px";
                                        l = V
                                    }
                                }
                            });
                            if (!l) return;
                            M = 0;
                            if (q) {
                                if (d - E - (h + k * a) !== x) M = d - E - (h + k * a) - x
                            } else if (Math.abs(d - E - (h + k * a)) !== 1) M = d - E - (h + k * a);
                            g.p.colModel[l].width += M;
                            g.p.tblwidth = h + M + k * a + E;
                            if (g.p.tblwidth > d) {
                                q = g.p.tblwidth - parseInt(d, 10);
                                g.p.tblwidth = d;
                                c = g.p.colModel[l].width -= q
                            } else c = g.p.colModel[l].width;
                            g.grid.headers[l].width = c;
                            g.grid.headers[l].el.style.width = c + "px";
                            if (N) g.grid.cols[l].style.width = c + "px";
                            if (g.p.footerrow) g.grid.footers[l].style.width = c + "px"
                        }
                        if (g.p.tblwidth) {
                            b("table:first", g.grid.bDiv).css("width", g.p.tblwidth + "px");
                            b("table:first", g.grid.hDiv).css("width", g.p.tblwidth + "px");
                            g.grid.hDiv.scrollLeft = g.grid.bDiv.scrollLeft;
                            g.p.footerrow && b("table:first", g.grid.sDiv).css("width", g.p.tblwidth + "px")
                        }
                    }
                }
            })
        },
        setGridHeight: function(d) {
            return this.each(function() {
                if (this.grid) {
                    var i = b(this.grid.bDiv);
                    i.css({
                        height: d + (isNaN(d) ? "": "px")
                    });
                    this.p.frozenColumns === true && b("#" + this.p.id + "_frozen").parent().height(i.height() - 16);
                    this.p.height = d;
                    this.p.scroll && this.grid.populateVisible()
                }
            })
        },
        setCaption: function(d) {
            return this.each(function() {
                this.p.caption = d;
                b("span.ui-jqgrid-title, span.ui-jqgrid-title-rtl", this.grid.cDiv).html(d);
                b(this.grid.cDiv).show()
            })
        },
        setLabel: function(d, i, g, c) {
            return this.each(function() {
                var h = -1;
                if (this.grid) if (typeof d != "undefined") {
                    b(this.p.colModel).each(function(a) {
                        if (this.name == d) {
                            h = a;
                            return false
                        }
                    });
                    if (h >= 0) {
                        var k = b("tr.ui-jqgrid-labels th:eq(" + h + ")", this.grid.hDiv);
                        if (i) {
                            var l = b(".s-ico", k);
                            b("[id^=jqgh_]", k).empty().html(i).append(l);
                            this.p.colNames[h] = i
                        }
                        if (g) typeof g === "string" ? b(k).addClass(g) : b(k).css(g);
                        typeof c === "object" && b(k).attr(c)
                    }
                }
            })
        },
        setCell: function(d, i, g, c, h, k) {
            return this.each(function() {
                var l = -1,
                a, q;
                if (this.grid) {
                    if (isNaN(i)) b(this.p.colModel).each(function(y) {
                        if (this.name == i) {
                            l = y;
                            return false
                        }
                    });
                    else l = parseInt(i, 10);
                    if (l >= 0) if (a = this.rows.namedItem(d)) {
                        var x = b("td:eq(" + l + ")", a);
                        if (g !== "" || k === true) {
                            a = this.formatter(d, g, l, a, "edit");
                            q = this.p.colModel[l].title ? {
                                title: b.jgrid.stripHtml(a)
                            }: {};
                            this.p.treeGrid && b(".tree-wrap", b(x)).length > 0 ? b("span", b(x)).html(a).attr(q) : b(x).html(a).attr(q);
                            if (this.p.datatype == "local") {
                                a = this.p.colModel[l];
                                g = a.formatter && typeof a.formatter === "string" && a.formatter == "date" ? b.unformat.date(g, a) : g;
                                q = this.p._index[d];
                                if (typeof q != "undefined") this.p.data[q][a.name] = g
                            }
                        }
                        if (typeof c === "string") b(x).addClass(c);
                        else c && b(x).css(c);
                        typeof h === "object" && b(x).attr(h)
                    }
                }
            })
        },
        getCell: function(d, i) {
            var g = false;
            this.each(function() {
                var c = -1;
                if (this.grid) {
                    if (isNaN(i)) b(this.p.colModel).each(function(l) {
                        if (this.name === i) {
                            c = l;
                            return false
                        }
                    });
                    else c = parseInt(i, 10);
                    if (c >= 0) {
                        var h = this.rows.namedItem(d);
                        if (h) try {
                            g = b.unformat(b("td:eq(" + c + ")", h), {
                                rowId: h.id,
                                colModel: this.p.colModel[c]
                            },
                            c)
                        } catch(k) {
                            g = b.jgrid.htmlDecode(b("td:eq(" + c + ")", h).html())
                        }
                    }
                }
            });
            return g
        },
        getCol: function(d, i, g) {
            var c = [],
            h,
            k = 0,
            l,
            a,
            q;
            i = typeof i != "boolean" ? false: i;
            if (typeof g == "undefined") g = false;
            this.each(function() {
                var x = -1;
                if (this.grid) {
                    if (isNaN(d)) b(this.p.colModel).each(function(M) {
                        if (this.name === d) {
                            x = M;
                            return false
                        }
                    });
                    else x = parseInt(d, 10);
                    if (x >= 0) {
                        var y = this.rows.length,
                        E = 0;
                        if (y && y > 0) {
                            for (; E < y;) {
                                if (b(this.rows[E]).hasClass("jqgrow")) {
                                    try {
                                        h = b.unformat(b(this.rows[E].cells[x]), {
                                            rowId: this.rows[E].id,
                                            colModel: this.p.colModel[x]
                                        },
                                        x)
                                    } catch(I) {
                                        h = b.jgrid.htmlDecode(this.rows[E].cells[x].innerHTML)
                                    }
                                    if (g) {
                                        q = parseFloat(h);
                                        k += q;
                                        if (E === 0) a = l = q;
                                        else {
                                            l = Math.min(l, q);
                                            a = Math.max(a, q)
                                        }
                                    } else i ? c.push({
                                        id: this.rows[E].id,
                                        value: h
                                    }) : c.push(h)
                                }
                                E++
                            }
                            if (g) switch (g.toLowerCase()) {
                            case "sum":
                                c = k;
                                break;
                            case "avg":
                                c = k / y;
                                break;
                            case "count":
                                c = y;
                                break;
                            case "min":
                                c = l;
                                break;
                            case "max":
                                c = a
                            }
                        }
                    }
                }
            });
            return c
        },
        clearGridData: function(d) {
            return this.each(function() {
                if (this.grid) {
                    if (typeof d != "boolean") d = false;
                    if (this.p.deepempty) b("#" + b.jgrid.jqID(this.p.id) + " tbody:first tr:gt(0)").remove();
                    else {
                        var i = b("#" + b.jgrid.jqID(this.p.id) + " tbody:first tr:first")[0];
                        b("#" + b.jgrid.jqID(this.p.id) + " tbody:first").empty().append(i)
                    }
                    this.p.footerrow && d && b(".ui-jqgrid-ftable td", this.grid.sDiv).html("&#160;");
                    this.p.selrow = null;
                    this.p.selarrrow = [];
                    this.p.savedRow = [];
                    this.p.records = 0;
                    this.p.page = 1;
                    this.p.lastpage = 0;
                    this.p.reccount = 0;
                    this.p.data = [];
                    this.p._index = {};
                    this.updatepager(true, false)
                }
            })
        },
        getInd: function(d, i) {
            var g = false,
            c;
            this.each(function() {
                if (c = this.rows.namedItem(d)) g = i === true ? c: c.rowIndex
            });
            return g
        },
        bindKeys: function(d) {
            var i = b.extend({
                onEnter: null,
                onSpace: null,
                onLeftKey: null,
                onRightKey: null,
                scrollingRows: true
            },
            d || {});
            return this.each(function() {
                var g = this;
                b("body").is("[role]") || b("body").attr("role", "application");
                g.p.scrollrows = i.scrollingRows;
                b(g).keydown(function(c) {
                    var h = b(g).find("tr[tabindex=0]")[0],
                    k,
                    l,
                    a,
                    q = g.p.treeReader.expanded_field;
                    if (h) {
                        a = g.p._index[h.id];
                        if (c.keyCode === 37 || c.keyCode === 38 || c.keyCode === 39 || c.keyCode === 40) {
                            if (c.keyCode === 38) {
                                l = h.previousSibling;
                                k = "";
                                if (l) if (b(l).is(":hidden")) for (; l;) {
                                    l = l.previousSibling;
                                    if (!b(l).is(":hidden") && b(l).hasClass("jqgrow")) {
                                        k = l.id;
                                        break
                                    }
                                } else k = l.id;
                                b(g).jqGrid("setSelection", k)
                            }
                            if (c.keyCode === 40) {
                                l = h.nextSibling;
                                k = "";
                                if (l) if (b(l).is(":hidden")) for (; l;) {
                                    l = l.nextSibling;
                                    if (!b(l).is(":hidden") && b(l).hasClass("jqgrow")) {
                                        k = l.id;
                                        break
                                    }
                                } else k = l.id;
                                b(g).jqGrid("setSelection", k)
                            }
                            if (c.keyCode === 37) {
                                g.p.treeGrid && g.p.data[a][q] && b(h).find("div.treeclick").trigger("click");
                                b.isFunction(i.onLeftKey) && i.onLeftKey.call(g, g.p.selrow)
                            }
                            if (c.keyCode === 39) {
                                g.p.treeGrid && !g.p.data[a][q] && b(h).find("div.treeclick").trigger("click");
                                b.isFunction(i.onRightKey) && i.onRightKey.call(g, g.p.selrow)
                            }
                        } else if (c.keyCode === 13) b.isFunction(i.onEnter) && i.onEnter.call(g, g.p.selrow);
                        else c.keyCode === 32 && b.isFunction(i.onSpace) && i.onSpace.call(g, g.p.selrow)
                    }
                })
            })
        },
        unbindKeys: function() {
            return this.each(function() {
                b(this).unbind("keydown")
            })
        },
        getLocalRow: function(d) {
            var i = false,
            g;
            this.each(function() {
                if (typeof d !== "undefined") {
                    g = this.p._index[d];
                    if (g >= 0) i = this.p.data[g]
                }
            });
            return i
        }
    })
})(jQuery); (function(b) {
    b.fmatter = {};
    b.extend(b.fmatter, {
        isBoolean: function(a) {
            return typeof a === "boolean"
        },
        isObject: function(a) {
            return a && (typeof a === "object" || b.isFunction(a)) || false
        },
        isString: function(a) {
            return typeof a === "string"
        },
        isNumber: function(a) {
            return typeof a === "number" && isFinite(a)
        },
        isNull: function(a) {
            return a === null
        },
        isUndefined: function(a) {
            return typeof a === "undefined"
        },
        isValue: function(a) {
            return this.isObject(a) || this.isString(a) || this.isNumber(a) || this.isBoolean(a)
        },
        isEmpty: function(a) {
            if (!this.isString(a) && this.isValue(a)) return false;
            else if (!this.isValue(a)) return true;
            a = b.trim(a).replace(/\&nbsp\;/ig, "").replace(/\&#160\;/ig, "");
            return a === ""
        }
    });
    b.fn.fmatter = function(a, c, d, f, g) {
        var e = c;
        d = b.extend({},
        b.jgrid.formatter, d);
        if (b.fn.fmatter[a]) e = b.fn.fmatter[a](c, d, f, g);
        return e
    };
    b.fmatter.util = {
        NumberFormat: function(a, c) {
            b.fmatter.isNumber(a) || (a *= 1);
            if (b.fmatter.isNumber(a)) {
                var d = a < 0,
                f = a + "",
                g = c.decimalSeparator ? c.decimalSeparator: ".",
                e;
                if (b.fmatter.isNumber(c.decimalPlaces)) {
                    var h = c.decimalPlaces;
                    f = Math.pow(10, h);
                    f = Math.round(a * f) / f + "";
                    e = f.lastIndexOf(".");
                    if (h > 0) {
                        if (e < 0) {
                            f += g;
                            e = f.length - 1
                        } else if (g !== ".") f = f.replace(".", g);
                        for (; f.length - 1 - e < h;) f += "0"
                    }
                }
                if (c.thousandsSeparator) {
                    h = c.thousandsSeparator;
                    e = f.lastIndexOf(g);
                    e = e > -1 ? e: f.length;
                    g = f.substring(e);
                    for (var i = -1,
                    j = e; j > 0; j--) {
                        i++;
                        if (i % 3 === 0 && j !== e && (!d || j > 1)) g = h + g;
                        g = f.charAt(j - 1) + g
                    }
                    f = g
                }
                f = c.prefix ? c.prefix + f: f;
                return f = c.suffix ? f + c.suffix: f
            } else return a
        },
        DateFormat: function(a, c, d, f) {
            var g = /^\/Date\((([-+])?[0-9]+)(([-+])([0-9]{2})([0-9]{2}))?\)\/$/,
            e = typeof c === "string" ? c.match(g) : null;
            g = function(m, r) {
                m = String(m);
                for (r = parseInt(r, 10) || 2; m.length < r;) m = "0" + m;
                return m
            };
            var h = {
                m: 1,
                d: 1,
                y: 1970,
                h: 0,
                i: 0,
                s: 0,
                u: 0
            },
            i = 0,
            j,
            k = ["i18n"];
            k.i18n = {
                dayNames: f.dayNames,
                monthNames: f.monthNames
            };
            if (a in f.masks) a = f.masks[a];
            if (!isNaN(c - 0) && String(a).toLowerCase() == "u") i = new Date(parseFloat(c) * 1E3);
            else if (c.constructor === Date) i = c;
            else if (e !== null) {
                i = new Date(parseInt(e[1], 10));
                if (e[3]) {
                    a = Number(e[5]) * 60 + Number(e[6]);
                    a *= e[4] == "-" ? 1 : -1;
                    a -= i.getTimezoneOffset();
                    i.setTime(Number(Number(i) + a * 6E4))
                }
            } else {
                c = String(c).split(/[\\\/:_;.,\t\T\s-]/);
                a = a.split(/[\\\/:_;.,\t\T\s-]/);
                e = 0;
                for (j = a.length; e < j; e++) {
                    if (a[e] == "M") {
                        i = b.inArray(c[e], k.i18n.monthNames);
                        if (i !== -1 && i < 12) c[e] = i + 1
                    }
                    if (a[e] == "F") {
                        i = b.inArray(c[e], k.i18n.monthNames);
                        if (i !== -1 && i > 11) c[e] = i + 1 - 12
                    }
                    if (c[e]) h[a[e].toLowerCase()] = parseInt(c[e], 10)
                }
                if (h.f) h.m = h.f;
                if (h.m === 0 && h.y === 0 && h.d === 0) return "&#160;";
                h.m = parseInt(h.m, 10) - 1;
                i = h.y;
                if (i >= 70 && i <= 99) h.y = 1900 + h.y;
                else if (i >= 0 && i <= 69) h.y = 2E3 + h.y;
                i = new Date(h.y, h.m, h.d, h.h, h.i, h.s, h.u)
            }
            if (d in f.masks) d = f.masks[d];
            else d || (d = "Y-m-d");
            a = i.getHours();
            c = i.getMinutes();
            h = i.getDate();
            e = i.getMonth() + 1;
            j = i.getTimezoneOffset();
            var l = i.getSeconds(),
            n = i.getMilliseconds(),
            o = i.getDay(),
            p = i.getFullYear(),
            q = (o + 6) % 7 + 1,
            s = (new Date(p, e - 1, h) - new Date(p, 0, 1)) / 864E5,
            t = {
                d: g(h),
                D: k.i18n.dayNames[o],
                j: h,
                l: k.i18n.dayNames[o + 7],
                N: q,
                S: f.S(h),
                w: o,
                z: s,
                W: q < 5 ? Math.floor((s + q - 1) / 7) + 1 : Math.floor((s + q - 1) / 7) || (((new Date(p - 1, 0, 1)).getDay() + 6) % 7 < 4 ? 53 : 52),
                F: k.i18n.monthNames[e - 1 + 12],
                m: g(e),
                M: k.i18n.monthNames[e - 1],
                n: e,
                t: "?",
                L: "?",
                o: "?",
                Y: p,
                y: String(p).substring(2),
                a: a < 12 ? f.AmPm[0] : f.AmPm[1],
                A: a < 12 ? f.AmPm[2] : f.AmPm[3],
                B: "?",
                g: a % 12 || 12,
                G: a,
                h: g(a % 12 || 12),
                H: g(a),
                i: g(c),
                s: g(l),
                u: n,
                e: "?",
                I: "?",
                O: (j > 0 ? "-": "+") + g(Math.floor(Math.abs(j) / 60) * 100 + Math.abs(j) % 60, 4),
                P: "?",
                T: (String(i).match(/\b(?:[PMCEA][SDP]T|(?:Pacific|Mountain|Central|Eastern|Atlantic) (?:Standard|Daylight|Prevailing) Time|(?:GMT|UTC)(?:[-+]\d{4})?)\b/g) || [""]).pop().replace(/[^-+\dA-Z]/g, ""),
                Z: "?",
                c: "?",
                r: "?",
                U: Math.floor(i / 1E3)
            };
            return d.replace(/\\.|[dDjlNSwzWFmMntLoYyaABgGhHisueIOPTZcrU]/g,
            function(m) {
                return m in t ? t[m] : m.substring(1)
            })
        }
    };
    b.fn.fmatter.defaultFormat = function(a, c) {
        return b.fmatter.isValue(a) && a !== "" ? a: c.defaultValue ? c.defaultValue: "&#160;"
    };
    b.fn.fmatter.email = function(a, c) {
        return b.fmatter.isEmpty(a) ? b.fn.fmatter.defaultFormat(a, c) : '<a href="mailto:' + a + '">' + a + "</a>"
    };
    b.fn.fmatter.checkbox = function(a, c) {
        var d = b.extend({},
        c.checkbox),
        f;
        b.fmatter.isUndefined(c.colModel.formatoptions) || (d = b.extend({},
        d, c.colModel.formatoptions));
        f = d.disabled === true ? 'disabled="disabled"': "";
        if (b.fmatter.isEmpty(a) || b.fmatter.isUndefined(a)) a = b.fn.fmatter.defaultFormat(a, d);
        a += "";
        a = a.toLowerCase();
        return '<input type="checkbox" ' + (a.search(/(false|0|no|off)/i) < 0 ? " checked='checked' ": "") + ' value="' + a + '" offval="no" ' + f + "/>"
    };
    b.fn.fmatter.link = function(a, c) {
        var d = {
            target: c.target
        },
        f = "";
        b.fmatter.isUndefined(c.colModel.formatoptions) || (d = b.extend({},
        d, c.colModel.formatoptions));
        if (d.target) f = "target=" + d.target;
        return b.fmatter.isEmpty(a) ? b.fn.fmatter.defaultFormat(a, c) : "<a " + f + ' href="' + a + '">' + a + "</a>"
    };
    b.fn.fmatter.showlink = function(a, c) {
        var d = {
            baseLinkUrl: c.baseLinkUrl,
            showAction: c.showAction,
            addParam: c.addParam || "",
            target: c.target,
            idName: c.idName
        },
        f = "";
        b.fmatter.isUndefined(c.colModel.formatoptions) || (d = b.extend({},
        d, c.colModel.formatoptions));
        if (d.target) f = "target=" + d.target;
        d = d.baseLinkUrl + d.showAction + "?" + d.idName + "=" + c.rowId + d.addParam;
        return b.fmatter.isString(a) || b.fmatter.isNumber(a) ? "<a " + f + ' href="' + d + '">' + a + "</a>": b.fn.fmatter.defaultFormat(a, c)
    };
    b.fn.fmatter.integer = function(a, c) {
        var d = b.extend({},
        c.integer);
        b.fmatter.isUndefined(c.colModel.formatoptions) || (d = b.extend({},
        d, c.colModel.formatoptions));
        if (b.fmatter.isEmpty(a)) return d.defaultValue;
        return b.fmatter.util.NumberFormat(a, d)
    };
    b.fn.fmatter.number = function(a, c) {
        var d = b.extend({},
        c.number);
        b.fmatter.isUndefined(c.colModel.formatoptions) || (d = b.extend({},
        d, c.colModel.formatoptions));
        if (b.fmatter.isEmpty(a)) return d.defaultValue;
        return b.fmatter.util.NumberFormat(a, d)
    };
    b.fn.fmatter.currency = function(a, c) {
        var d = b.extend({},
        c.currency);
        b.fmatter.isUndefined(c.colModel.formatoptions) || (d = b.extend({},
        d, c.colModel.formatoptions));
        if (b.fmatter.isEmpty(a)) return d.defaultValue;
        return b.fmatter.util.NumberFormat(a, d)
    };
    b.fn.fmatter.date = function(a, c, d, f) {
        d = b.extend({},
        c.date);
        b.fmatter.isUndefined(c.colModel.formatoptions) || (d = b.extend({},
        d, c.colModel.formatoptions));
        return ! d.reformatAfterEdit && f == "edit" ? b.fn.fmatter.defaultFormat(a, c) : b.fmatter.isEmpty(a) ? b.fn.fmatter.defaultFormat(a, c) : b.fmatter.util.DateFormat(d.srcformat, a, d.newformat, d)
    };
    b.fn.fmatter.select = function(a, c) {
        a += "";
        var d = false,
        f = [],
        g;
        if (b.fmatter.isUndefined(c.colModel.formatoptions)) {
            if (!b.fmatter.isUndefined(c.colModel.editoptions)) {
                d = c.colModel.editoptions.value;
                g = c.colModel.editoptions.separator === undefined ? ":": c.colModel.editoptions.separator
            }
        } else {
            d = c.colModel.formatoptions.value;
            g = c.colModel.formatoptions.separator === undefined ? ":": c.colModel.formatoptions.separator
        }
        if (d) {
            var e = c.colModel.editoptions.multiple === true ? true: false,
            h = [],
            i;
            if (e) {
                h = a.split(",");
                h = b.map(h,
                function(n) {
                    return b.trim(n)
                })
            }
            if (b.fmatter.isString(d)) for (var j = d.split(";"), k = 0, l = 0; l < j.length; l++) {
                i = j[l].split(g);
                if (i.length > 2) i[1] = jQuery.map(i,
                function(n, o) {
                    if (o > 0) return n
                }).join(":");
                if (e) {
                    if (jQuery.inArray(i[0], h) > -1) {
                        f[k] = i[1];
                        k++
                    }
                } else if (b.trim(i[0]) == b.trim(a)) {
                    f[0] = i[1];
                    break
                }
            } else if (b.fmatter.isObject(d)) if (e) f = jQuery.map(h,
            function(n) {
                return d[n]
            });
            else f[0] = d[a] || ""
        }
        a = f.join(", ");
        return a === "" ? b.fn.fmatter.defaultFormat(a, c) : a
    };
    b.fn.fmatter.rowactions = function(a, c, d, f) {
        var g = {
            keys: false,
            onEdit: null,
            onSuccess: null,
            afterSave: null,
            onError: null,
            afterRestore: null,
            extraparam: {},
            url: null,
            delOptions: {},
            editOptions: {}
        };
        a = b.jgrid.jqID(a);
        c = b.jgrid.jqID(c);
        f = b("#" + c)[0].p.colModel[f];
        b.fmatter.isUndefined(f.formatoptions) || (g = b.extend(g, f.formatoptions));
        if (!b.fmatter.isUndefined(b("#" + c)[0].p.editOptions)) g.editOptions = b("#" + c)[0].p.editOptions;
        if (!b.fmatter.isUndefined(b("#" + c)[0].p.delOptions)) g.delOptions = b("#" + c)[0].p.delOptions;
        var e = b("#" + c)[0];
        f = function(j, k) {
            g.afterSave && g.afterSave.call(e, j, k);
            b("tr#" + a + " div.ui-inline-edit, tr#" + a + " div.ui-inline-del", "#" + c + ".ui-jqgrid-btable:first").show();
            b("tr#" + a + " div.ui-inline-save, tr#" + a + " div.ui-inline-cancel", "#" + c + ".ui-jqgrid-btable:first").hide()
        };
        var h = function(j) {
            g.afterRestore && g.afterRestore.call(e, j);
            b("tr#" + a + " div.ui-inline-edit, tr#" + a + " div.ui-inline-del", "#" + c + ".ui-jqgrid-btable:first").show();
            b("tr#" + a + " div.ui-inline-save, tr#" + a + " div.ui-inline-cancel", "#" + c + ".ui-jqgrid-btable:first").hide()
        };
        if (b("#" + a, "#" + c).hasClass("jqgrid-new-row")) {
            var i = e.p.prmNames;
            g.extraparam[i.oper] = i.addoper
        }
        switch (d) {
        case "edit":
            b("#" + c).jqGrid("editRow", a, g.keys, g.onEdit, g.onSuccess, g.url, g.extraparam, f, g.onError, h);
            b("tr#" + a + " div.ui-inline-edit, tr#" + a + " div.ui-inline-del", "#" + c + ".ui-jqgrid-btable:first").hide();
            b("tr#" + a + " div.ui-inline-save, tr#" + a + " div.ui-inline-cancel", "#" + c + ".ui-jqgrid-btable:first").show();
            b.isFunction(e.p._complete) && e.p._complete.call(e);
            break;
        case "save":
            if (b("#" + c).jqGrid("saveRow", a, g.onSuccess, g.url, g.extraparam, f, g.onError, h)) {
                b("tr#" + a + " div.ui-inline-edit, tr#" + a + " div.ui-inline-del", "#" + c + ".ui-jqgrid-btable:first").show();
                b("tr#" + a + " div.ui-inline-save, tr#" + a + " div.ui-inline-cancel", "#" + c + ".ui-jqgrid-btable:first").hide();
                b.isFunction(e.p._complete) && e.p._complete.call(e)
            }
            break;
        case "cancel":
            b("#" + c).jqGrid("restoreRow", a, h);
            b("tr#" + a + " div.ui-inline-edit, tr#" + a + " div.ui-inline-del", "#" + c + ".ui-jqgrid-btable:first").show();
            b("tr#" + a + " div.ui-inline-save, tr#" + a + " div.ui-inline-cancel", "#" + c + ".ui-jqgrid-btable:first").hide();
            b.isFunction(e.p._complete) && e.p._complete.call(e);
            break;
        case "del":
            b("#" + c).jqGrid("delGridRow", a, g.delOptions);
            break;
        case "formedit":
            b("#" + c).jqGrid("setSelection", a);
            b("#" + c).jqGrid("editGridRow", a, g.editOptions)
        }
    };
    b.fn.fmatter.actions = function(a, c) {
        var d = {
            keys: false,
            editbutton: true,
            delbutton: true,
            editformbutton: false
        };
        b.fmatter.isUndefined(c.colModel.formatoptions) || (d = b.extend(d, c.colModel.formatoptions));
        var f = c.rowId,
        g = "",
        e;
        if (typeof f == "undefined" || b.fmatter.isEmpty(f)) return "";
        if (d.editformbutton) {
            e = "onclick=jQuery.fn.fmatter.rowactions('" + f + "','" + c.gid + "','formedit'," + c.pos + "); onmouseover=jQuery(this).addClass('ui-state-hover'); onmouseout=jQuery(this).removeClass('ui-state-hover'); ";
            g = g + "<div title='" + b.jgrid.nav.edittitle + "' style='float:left;cursor:pointer;' class='ui-pg-div ui-inline-edit' " + e + "><span class='ui-icon ui-icon-pencil'></span></div>"
        } else if (d.editbutton) {
            e = "onclick=jQuery.fn.fmatter.rowactions('" + f + "','" + c.gid + "','edit'," + c.pos + "); onmouseover=jQuery(this).addClass('ui-state-hover'); onmouseout=jQuery(this).removeClass('ui-state-hover') ";
            g = g + "<div title='" + b.jgrid.nav.edittitle + "' style='float:left;cursor:pointer;' class='ui-pg-div ui-inline-edit' " + e + "><span class='ui-icon ui-icon-pencil'></span></div>"
        }
        if (d.delbutton) {
            e = "onclick=jQuery.fn.fmatter.rowactions('" + f + "','" + c.gid + "','del'," + c.pos + "); onmouseover=jQuery(this).addClass('ui-state-hover'); onmouseout=jQuery(this).removeClass('ui-state-hover'); ";
            g = g + "<div title='" + b.jgrid.nav.deltitle + "' style='float:left;margin-left:5px;' class='ui-pg-div ui-inline-del' " + e + "><span class='ui-icon ui-icon-trash'></span></div>"
        }
        e = "onclick=jQuery.fn.fmatter.rowactions('" + f + "','" + c.gid + "','save'," + c.pos + "); onmouseover=jQuery(this).addClass('ui-state-hover'); onmouseout=jQuery(this).removeClass('ui-state-hover'); ";
        g = g + "<div title='" + b.jgrid.edit.bSubmit + "' style='float:left;display:none' class='ui-pg-div ui-inline-save' " + e + "><span class='ui-icon ui-icon-disk'></span></div>";
        e = "onclick=jQuery.fn.fmatter.rowactions('" + f + "','" + c.gid + "','cancel'," + c.pos + "); onmouseover=jQuery(this).addClass('ui-state-hover'); onmouseout=jQuery(this).removeClass('ui-state-hover'); ";
        g = g + "<div title='" + b.jgrid.edit.bCancel + "' style='float:left;display:none;margin-left:5px;' class='ui-pg-div ui-inline-cancel' " + e + "><span class='ui-icon ui-icon-cancel'></span></div>";
        return "<div style='margin-left:8px;'>" + g + "</div>"
    };
    b.unformat = function(a, c, d, f) {
        var g, e = c.colModel.formatter,
        h = c.colModel.formatoptions || {},
        i = /([\.\*\_\'\(\)\{\}\+\?\\])/g,
        j = c.colModel.unformat || b.fn.fmatter[e] && b.fn.fmatter[e].unformat;
        if (typeof j !== "undefined" && b.isFunction(j)) g = j(b(a).text(), c, a);
        else if (!b.fmatter.isUndefined(e) && b.fmatter.isString(e)) {
            g = b.jgrid.formatter || {};
            switch (e) {
            case "integer":
                h = b.extend({},
                g.integer, h);
                c = h.thousandsSeparator.replace(i, "\\$1");
                g = b(a).text().replace(RegExp(c, "g"), "");
                break;
            case "number":
                h = b.extend({},
                g.number, h);
                c = h.thousandsSeparator.replace(i, "\\$1");
                g = b(a).text().replace(RegExp(c, "g"), "").replace(h.decimalSeparator, ".");
                break;
            case "currency":
                h = b.extend({},
                g.currency, h);
                c = h.thousandsSeparator.replace(i, "\\$1");
                g = b(a).text().replace(RegExp(c, "g"), "").replace(h.decimalSeparator, ".").replace(h.prefix, "").replace(h.suffix, "");
                break;
            case "checkbox":
                h = c.colModel.editoptions ? c.colModel.editoptions.value.split(":") : ["Yes", "No"];
                g = b("input", a).is(":checked") ? h[0] : h[1];
                break;
            case "select":
                g = b.unformat.select(a, c, d, f);
                break;
            case "actions":
                return "";
            default:
                g = b(a).text()
            }
        }
        return g !== undefined ? g: f === true ? b(a).text() : b.jgrid.htmlDecode(b(a).html())
    };
    b.unformat.select = function(a, c, d, f) {
        d = [];
        a = b(a).text();
        if (f === true) return a;
        c = b.extend({},
        c.colModel.editoptions);
        if (c.value) {
            var g = c.value;
            c = c.multiple === true ? true: false;
            f = [];
            var e;
            if (c) {
                f = a.split(",");
                f = b.map(f,
                function(k) {
                    return b.trim(k)
                })
            }
            if (b.fmatter.isString(g)) for (var h = g.split(";"), i = 0, j = 0; j < h.length; j++) {
                e = h[j].split(":");
                if (e.length > 2) e[1] = jQuery.map(e,
                function(k, l) {
                    if (l > 0) return k
                }).join(":");
                if (c) {
                    if (jQuery.inArray(e[1], f) > -1) {
                        d[i] = e[0];
                        i++
                    }
                } else if (b.trim(e[1]) == b.trim(a)) {
                    d[0] = e[0];
                    break
                }
            } else if (b.fmatter.isObject(g) || b.isArray(g)) {
                c || (f[0] = a);
                d = jQuery.map(f,
                function(k) {
                    var l;
                    b.each(g,
                    function(n, o) {
                        if (o == k) {
                            l = n;
                            return false
                        }
                    });
                    if (typeof l != "undefined") return l
                })
            }
            return d.join(", ")
        } else return a || ""
    };
    b.unformat.date = function(a, c) {
        var d = b.jgrid.formatter.date || {};
        b.fmatter.isUndefined(c.formatoptions) || (d = b.extend({},
        d, c.formatoptions));
        return b.fmatter.isEmpty(a) ? b.fn.fmatter.defaultFormat(a, c) : b.fmatter.util.DateFormat(d.newformat, a, d.srcformat, d)
    }
})(jQuery); (function(a) {
    a.jgrid.extend({
        getColProp: function(b) {
            var e = {},
            c = this[0];
            if (!c.grid) return false;
            c = c.p.colModel;
            for (var j = 0; j < c.length; j++) if (c[j].name == b) {
                e = c[j];
                break
            }
            return e
        },
        setColProp: function(b, e) {
            return this.each(function() {
                if (this.grid) if (e) for (var c = this.p.colModel,
                j = 0; j < c.length; j++) if (c[j].name == b) {
                    a.extend(this.p.colModel[j], e);
                    break
                }
            })
        },
        sortGrid: function(b, e, c) {
            return this.each(function() {
                var j = -1;
                if (this.grid) {
                    if (!b) b = this.p.sortname;
                    for (var k = 0; k < this.p.colModel.length; k++) if (this.p.colModel[k].index == b || this.p.colModel[k].name == b) {
                        j = k;
                        break
                    }
                    if (j != -1) {
                        k = this.p.colModel[j].sortable;
                        if (typeof k !== "boolean") k = true;
                        if (typeof e !== "boolean") e = false;
                        k && this.sortData("jqgh_" + this.p.id + "_" + b, j, e, c)
                    }
                }
            })
        },
        GridDestroy: function() {
            return this.each(function() {
                if (this.grid) {
                    this.p.pager && a(this.p.pager).remove();
                    var b = this.id;
                    try {
                        a("#gbox_" + b).remove()
                    } catch(e) {}
                }
            })
        },
        GridUnload: function() {
            return this.each(function() {
                if (this.grid) {
                    var b = {
                        id: a(this).attr("id"),
                        cl: a(this).attr("class")
                    };
                    this.p.pager && a(this.p.pager).empty().removeClass("ui-state-default ui-jqgrid-pager corner-bottom");
                    var e = document.createElement("table");
                    a(e).attr({
                        id: b.id
                    });
                    e.className = b.cl;
                    b = this.id;
                    a(e).removeClass("ui-jqgrid-btable");
                    if (a(this.p.pager).parents("#gbox_" + b).length === 1) {
                        a(e).insertBefore("#gbox_" + b).show();
                        a(this.p.pager).insertBefore("#gbox_" + b)
                    } else a(e).insertBefore("#gbox_" + b).show();
                    a("#gbox_" + b).remove()
                }
            })
        },
        setGridState: function(b) {
            return this.each(function() {
                if (this.grid) if (b == "hidden") {
                    a(".ui-jqgrid-bdiv, .ui-jqgrid-hdiv", "#gview_" + this.p.id).slideUp("fast");
                    this.p.pager && a(this.p.pager).slideUp("fast");
                    this.p.toppager && a(this.p.toppager).slideUp("fast");
                    if (this.p.toolbar[0] === true) {
                        this.p.toolbar[1] == "both" && a(this.grid.ubDiv).slideUp("fast");
                        a(this.grid.uDiv).slideUp("fast")
                    }
                    this.p.footerrow && a(".ui-jqgrid-sdiv", "#gbox_" + this.p.id).slideUp("fast");
                    a(".ui-jqgrid-titlebar-close span", this.grid.cDiv).removeClass("ui-icon-circle-triangle-n").addClass("ui-icon-circle-triangle-s");
                    this.p.gridstate = "hidden"
                } else if (b == "visible") {
                    a(".ui-jqgrid-hdiv, .ui-jqgrid-bdiv", "#gview_" + this.p.id).slideDown("fast");
                    this.p.pager && a(this.p.pager).slideDown("fast");
                    this.p.toppager && a(this.p.toppager).slideDown("fast");
                    if (this.p.toolbar[0] === true) {
                        this.p.toolbar[1] == "both" && a(this.grid.ubDiv).slideDown("fast");
                        a(this.grid.uDiv).slideDown("fast")
                    }
                    this.p.footerrow && a(".ui-jqgrid-sdiv", "#gbox_" + this.p.id).slideDown("fast");
                    a(".ui-jqgrid-titlebar-close span", this.grid.cDiv).removeClass("ui-icon-circle-triangle-s").addClass("ui-icon-circle-triangle-n");
                    this.p.gridstate = "visible"
                }
            })
        },
        filterToolbar: function(b) {
            b = a.extend({
                autosearch: true,
                searchOnEnter: true,
                beforeSearch: null,
                afterSearch: null,
                beforeClear: null,
                afterClear: null,
                searchurl: "",
                stringResult: false,
                groupOp: "AND",
                defaultSearch: "bw"
            },
            b || {});
            return this.each(function() {
                function e(d, g) {
                    var h = a(d);
                    h[0] && jQuery.each(g,
                    function() {
                        this.data !== undefined ? h.bind(this.type, this.data, this.fn) : h.bind(this.type, this.fn)
                    })
                }
                var c = this;
                if (!this.ftoolbar) {
                    var j = function() {
                        var d = {},
                        g = 0,
                        h, f, i = {},
                        m;
                        a.each(c.p.colModel,
                        function() {
                            f = this.index || this.name;
                            m = this.searchoptions && this.searchoptions.sopt ? this.searchoptions.sopt[0] : this.stype == "select" ? "eq": b.defaultSearch;
                            if (h = a("#gs_" + a.jgrid.jqID(this.name), this.frozen === true && c.p.frozenColumns === true ? c.grid.fhDiv: c.grid.hDiv).val()) {
                                d[f] = h;
                                i[f] = m;
                                g++
                            } else try {
                                delete c.p.postData[f]
                            } catch(r) {}
                        });
                        var n = g > 0 ? true: false;
                        if (b.stringResult === true || c.p.datatype == "local") {
                            var l = '{"groupOp":"' + b.groupOp + '","rules":[',
                            t = 0;
                            a.each(d,
                            function(r, v) {
                                if (t > 0) l += ",";
                                l += '{"field":"' + r + '",';
                                l += '"op":"' + i[r] + '",';
                                v += "";
                                l += '"data":"' + v.replace(/\\/g, "\\\\").replace(/\"/g, '\\"') + '"}';
                                t++
                            });
                            l += "]}";
                            a.extend(c.p.postData, {
                                filters: l
                            });
                            a.each(["searchField", "searchString", "searchOper"],
                            function(r, v) {
                                c.p.postData.hasOwnProperty(v) && delete c.p.postData[v]
                            })
                        } else a.extend(c.p.postData, d);
                        var o;
                        if (c.p.searchurl) {
                            o = c.p.url;
                            a(c).jqGrid("setGridParam", {
                                url: c.p.searchurl
                            })
                        }
                        var q = false;
                        if (a.isFunction(b.beforeSearch)) q = b.beforeSearch.call(c);
                        q || a(c).jqGrid("setGridParam", {
                            search: n
                        }).trigger("reloadGrid", [{
                            page: 1
                        }]);
                        o && a(c).jqGrid("setGridParam", {
                            url: o
                        });
                        a.isFunction(b.afterSearch) && b.afterSearch()
                    },
                    k = a("<tr class='ui-search-toolbar' role='rowheader'></tr>"),
                    p;
                    a.each(c.p.colModel,
                    function() {
                        var d = this,
                        g, h, f, i;
                        h = a("<th role='columnheader' class='ui-state-default ui-th-column ui-th-" + c.p.direction + "'></th>");
                        g = a("<div style='width:100%;position:relative;height:100%;padding-right:0.3em;'></div>");
                        this.hidden === true && a(h).css("display", "none");
                        this.search = this.search === false ? false: true;
                        if (typeof this.stype == "undefined") this.stype = "text";
                        f = a.extend({},
                        this.searchoptions || {});
                        if (this.search) switch (this.stype) {
                        case "select":
                            if (i = this.surl || f.dataUrl) a.ajax(a.extend({
                                url: i,
                                dataType: "html",
                                success: function(o) {
                                    if (f.buildSelect !== undefined)(o = f.buildSelect(o)) && a(g).append(o);
                                    else a(g).append(o);
                                    f.defaultValue && a("select", g).val(f.defaultValue);
                                    a("select", g).attr({
                                        name: d.index || d.name,
                                        id: "gs_" + d.name
                                    });
                                    f.attr && a("select", g).attr(f.attr);
                                    a("select", g).css({
                                        width: "100%"
                                    });
                                    f.dataInit !== undefined && f.dataInit(a("select", g)[0]);
                                    f.dataEvents !== undefined && e(a("select", g)[0], f.dataEvents);
                                    b.autosearch === true && a("select", g).change(function() {
                                        j();
                                        return false
                                    });
                                    o = null
                                }
                            },
                            a.jgrid.ajaxOptions, c.p.ajaxSelectOptions || {}));
                            else {
                                var m;
                                if (d.searchoptions && d.searchoptions.value) m = d.searchoptions.value;
                                else if (d.editoptions && d.editoptions.value) m = d.editoptions.value;
                                if (m) {
                                    i = document.createElement("select");
                                    i.style.width = "100%";
                                    a(i).attr({
                                        name: d.index || d.name,
                                        id: "gs_" + d.name
                                    });
                                    var n, l;
                                    if (typeof m === "string") {
                                        m = m.split(";");
                                        for (var t = 0; t < m.length; t++) {
                                            n = m[t].split(":");
                                            l = document.createElement("option");
                                            l.value = n[0];
                                            l.innerHTML = n[1];
                                            i.appendChild(l)
                                        }
                                    } else if (typeof m === "object") for (n in m) if (m.hasOwnProperty(n)) {
                                        l = document.createElement("option");
                                        l.value = n;
                                        l.innerHTML = m[n];
                                        i.appendChild(l)
                                    }
                                    f.defaultValue && a(i).val(f.defaultValue);
                                    f.attr && a(i).attr(f.attr);
                                    f.dataInit !== undefined && f.dataInit(i);
                                    f.dataEvents !== undefined && e(i, f.dataEvents);
                                    a(g).append(i);
                                    b.autosearch === true && a(i).change(function() {
                                        j();
                                        return false
                                    })
                                }
                            }
                            break;
                        case "text":
                            i = f.defaultValue ? f.defaultValue: "";
                            a(g).append("<input type='text' style='width:95%;padding:0px;' name='" + (d.index || d.name) + "' id='gs_" + d.name + "' value='" + i + "'/>");
                            f.attr && a("input", g).attr(f.attr);
                            f.dataInit !== undefined && f.dataInit(a("input", g)[0]);
                            f.dataEvents !== undefined && e(a("input", g)[0], f.dataEvents);
                            if (b.autosearch === true) b.searchOnEnter ? a("input", g).keypress(function(o) {
                                if ((o.charCode ? o.charCode: o.keyCode ? o.keyCode: 0) == 13) {
                                    j();
                                    return false
                                }
                                return this
                            }) : a("input", g).keydown(function(o) {
                                switch (o.which) {
                                case 13:
                                    return false;
                                case 9:
                                case 16:
                                case 37:
                                case 38:
                                case 39:
                                case 40:
                                case 27:
                                    break;
                                default:
                                    p && clearTimeout(p);
                                    p = setTimeout(function() {
                                        j()
                                    },
                                    500)
                                }
                            })
                        }
                        a(h).append(g);
                        a(k).append(h)
                    });
                    a("table thead", c.grid.hDiv).append(k);
                    this.ftoolbar = true;
                    this.triggerToolbar = j;
                    this.clearToolbar = function(d) {
                        var g = {},
                        h, f = 0,
                        i;
                        d = typeof d != "boolean" ? true: d;
                        a.each(c.p.colModel,
                        function() {
                            h = this.searchoptions && this.searchoptions.defaultValue ? this.searchoptions.defaultValue: "";
                            i = this.index || this.name;
                            switch (this.stype) {
                            case "select":
                                var q;
                                a("#gs_" + a.jgrid.jqID(this.name) + " option", this.frozen === true && c.p.frozenColumns === true ? c.grid.fhDiv: c.grid.hDiv).each(function(s) {
                                    if (s === 0) this.selected = true;
                                    if (a(this).text() == h) {
                                        this.selected = true;
                                        q = a(this).val();
                                        return false
                                    }
                                });
                                if (q) {
                                    g[i] = q;
                                    f++
                                } else try {
                                    delete c.p.postData[i]
                                } catch(r) {}
                                break;
                            case "text":
                                a("#gs_" + a.jgrid.jqID(this.name), this.frozen === true && c.p.frozenColumns === true ? c.grid.fhDiv: c.grid.hDiv).val(h);
                                if (h) {
                                    g[i] = h;
                                    f++
                                } else try {
                                    delete c.p.postData[i]
                                } catch(v) {}
                            }
                        });
                        var m = f > 0 ? true: false;
                        if (b.stringResult === true || c.p.datatype == "local") {
                            var n = '{"groupOp":"' + b.groupOp + '","rules":[',
                            l = 0;
                            a.each(g,
                            function(q, r) {
                                if (l > 0) n += ",";
                                n += '{"field":"' + q + '",';
                                n += '"op":"eq",';
                                r += "";
                                n += '"data":"' + r.replace(/\\/g, "\\\\").replace(/\"/g, '\\"') + '"}';
                                l++
                            });
                            n += "]}";
                            a.extend(c.p.postData, {
                                filters: n
                            });
                            a.each(["searchField", "searchString", "searchOper"],
                            function(q, r) {
                                c.p.postData.hasOwnProperty(r) && delete c.p.postData[r]
                            })
                        } else a.extend(c.p.postData, g);
                        var t;
                        if (c.p.searchurl) {
                            t = c.p.url;
                            a(c).jqGrid("setGridParam", {
                                url: c.p.searchurl
                            })
                        }
                        var o = false;
                        if (a.isFunction(b.beforeClear)) o = b.beforeClear.call(c);
                        o || d && a(c).jqGrid("setGridParam", {
                            search: m
                        }).trigger("reloadGrid", [{
                            page: 1
                        }]);
                        t && a(c).jqGrid("setGridParam", {
                            url: t
                        });
                        a.isFunction(b.afterClear) && b.afterClear()
                    };
                    this.toggleToolbar = function() {
                        var d = a("tr.ui-search-toolbar", c.grid.hDiv),
                        g = c.p.frozenColumns === true ? a("tr.ui-search-toolbar", c.grid.hDiv) : false;
                        if (d.css("display") == "none") {
                            d.show();
                            g && g.show()
                        } else {
                            d.hide();
                            g && g.hide()
                        }
                    }
                }
            })
        },
        destroyGroupHeader: function(b) {
            if (typeof b == "undefined") b = true;
            return this.each(function() {
                var e, c, j, k, p, d;
                c = this.grid;
                var g = a("table.ui-jqgrid-htable thead", c.hDiv),
                h = this.p.colModel;
                if (c) {
                    e = a("<tr>", {
                        role: "rowheader"
                    }).addClass("ui-jqgrid-labels");
                    k = c.headers;
                    c = 0;
                    for (j = k.length; c < j; c++) {
                        p = h[c].hidden ? "none": "";
                        p = a(k[c].el).width(k[c].width).css("display", p);
                        try {
                            p.removeAttr("rowSpan")
                        } catch(f) {
                            p.attr("rowSpan", 1)
                        }
                        e.append(p);
                        d = p.children("span.ui-jqgrid-resize");
                        if (d.length > 0) d[0].style.height = "";
                        p.children("div")[0].style.top = ""
                    }
                    a(g).children("tr.ui-jqgrid-labels").remove();
                    a(g).prepend(e);
                    b === true && a(this).jqGrid("setGridParam", {
                        groupHeader: null
                    })
                }
            })
        },
        setGroupHeaders: function(b) {
            b = a.extend({
                useColSpanStyle: false,
                groupHeaders: []
            },
            b || {});
            return this.each(function() {
                this.p.groupHeader = b;
                var e = this,
                c, j, k = 0,
                p, d, g, h, f, i = e.p.colModel,
                m = i.length,
                n = e.grid.headers,
                l = a("table.ui-jqgrid-htable", e.grid.hDiv),
                t = l.children("thead").children("tr.ui-jqgrid-labels:last").addClass("jqg-second-row-header");
                p = l.children("thead");
                var o, q = l.find(".jqg-first-row-header");
                if (q.html() === null) q = a("<tr>", {
                    role: "row",
                    "aria-hidden": "true"
                }).addClass("jqg-first-row-header").css("height", "auto");
                else q.empty();
                var r, v = function(s, u) {
                    for (var w = 0,
                    x = u.length; w < x; w++) if (u[w].startColumnName === s) return w;
                    return - 1
                };
                a(e).prepend(p);
                p = a("<tr>", {
                    role: "rowheader"
                }).addClass("ui-jqgrid-labels jqg-third-row-header");
                for (c = 0; c < m; c++) {
                    g = n[c].el;
                    h = a(g);
                    j = i[c];
                    d = {
                        height: "0px",
                        width: n[c].width + "px",
                        display: j.hidden ? "none": ""
                    };
                    a("<th>", {
                        role: "gridcell"
                    }).css(d).addClass("ui-first-th-" + e.p.direction).appendTo(q);
                    g.style.width = "";
                    d = v(j.name, b.groupHeaders);
                    if (d >= 0) {
                        d = b.groupHeaders[d];
                        k = d.numberOfColumns;
                        f = d.titleText;
                        for (d = j = 0; d < k && c + d < m; d++) i[c + d].hidden || j++;
                        d = a("<th>").attr({
                            role: "columnheader"
                        }).addClass("ui-state-default ui-th-column-header ui-th-" + e.p.direction).css({
                            height: "22px",
                            "border-top": "0px none"
                        }).html(f);
                        j > 0 && d.attr("colspan", String(j));
                        e.p.headertitles && d.attr("title", d.text());
                        j === 0 && d.hide();
                        h.before(d);
                        p.append(g);
                        k -= 1
                    } else if (k === 0) if (b.useColSpanStyle) h.attr("rowspan", "2");
                    else {
                        a("<th>", {
                            role: "columnheader"
                        }).addClass("ui-state-default ui-th-column-header ui-th-" + e.p.direction).css({
                            display: j.hidden ? "none": "",
                            "border-top": "0px none"
                        }).insertBefore(h);
                        p.append(g)
                    } else {
                        p.append(g);
                        k--
                    }
                }
                i = a(e).children("thead");
                i.prepend(q);
                p.insertAfter(t);
                l.append(i);
                if (b.useColSpanStyle) {
                    l.find("span.ui-jqgrid-resize").each(function() {
                        var s = a(this).parent();
                        if (s.is(":visible")) this.style.cssText = "height: " + s.height() + "px !important; cursor: col-resize;"
                    });
                    l.find("div.ui-jqgrid-sortable").each(function() {
                        var s = a(this),
                        u = s.parent();
                        u.is(":visible") && u.is(":has(span.ui-jqgrid-resize)") && s.css("top", (u.height() - s.outerHeight()) / 2 + "px")
                    })
                }
                if (a.isFunction(e.p.resizeStop)) o = e.p.resizeStop;
                r = i.find("tr.jqg-first-row-header");
                e.p.resizeStop = function(s, u) {
                    r.find("th").eq(u).width(s);
                    a.isFunction(o) && o.call(e, s, u)
                }
            })
        },
        setFrozenColumns: function() {
            return this.each(function() {
                if (this.grid) {
                    var b = this,
                    e = b.p.colModel,
                    c = 0,
                    j = e.length,
                    k = -1,
                    p = false;
                    if (! (b.p.subGrid == true || b.p.treeGrid === true || b.p.cellEdit == true || b.p.sortable || b.p.scroll || b.p.grouping)) {
                        b.p.rownumbers && c++;
                        for (b.p.multiselect && c++; c < j;) {
                            if (e[c].frozen === true) {
                                p = true;
                                k = c
                            } else break;
                            c++
                        }
                        if (k >= 0 && p) {
                            e = b.p.caption ? a(b.grid.cDiv).outerHeight() : 0;
                            c = a(".ui-jqgrid-htable", "#gview_" + a.jgrid.jqID(b.p.id)).height();
                            b.p.orgEvents = {};
                            if (b.p.toppager) e += a(b.grid.topDiv).outerHeight();
                            if (b.p.toolbar[0] == true) if (b.p.toolbar[1] != "bottom") e += a(b.grid.uDiv).outerHeight();
                            b.grid.fhDiv = a('<div style="position:absolute;left:0px;top:' + e + "px;height:" + c + 'px;" class="frozen-div ui-state-default ui-jqgrid-hdiv"></div>');
                            b.grid.fbDiv = a('<div style="position:absolute;left:0px;top:' + (parseInt(e, 10) + parseInt(c, 10) + 1) + 'px;overflow-y:hidden" class="frozen-bdiv ui-jqgrid-bdiv"></div>');
                            a("#gview_" + a.jgrid.jqID(b.p.id)).append(b.grid.fhDiv);
                            e = a(".ui-jqgrid-htable", "#gview_" + a.jgrid.jqID(b.p.id)).clone(true);
                            if (b.p.groupHeader) {
                                a("tr.jqg-first-row-header, tr.jqg-third-row-header", e).each(function() {
                                    a("th:gt(" + k + ")", this).remove()
                                });
                                var d = -1,
                                g = -1;
                                a("tr.jqg-second-row-header th", e).each(function() {
                                    var h = parseInt(a(this).attr("colspan"), 10);
                                    if (h) {
                                        d += h;
                                        g++
                                    }
                                    if (d === k) return false
                                });
                                if (d !== k) g = k;
                                a("tr.jqg-second-row-header", e).each(function() {
                                    a("th:gt(" + g + ")", this).remove()
                                })
                            } else a("tr", e).each(function() {
                                a("th:gt(" + k + ")", this).remove()
                            });
                            a(e).width(1);
                            a(b.grid.fhDiv).append(e).mousemove(function(h) {
                                if (b.grid.resizing) {
                                    b.grid.dragMove(h);
                                    return false
                                }
                            });
                            if (a.isFunction(b.p.resizeStop)) b.p.orgEvents.resizeStop = b.p.resizeStop;
                            b.p.resizeStop = function(h, f) {
                                var i = a(".ui-jqgrid-htable", b.grid.fhDiv);
                                a("th:eq(" + f + ")", i).width(h);
                                i = a(".ui-jqgrid-btable", b.grid.fbDiv);
                                a("tr:first td:eq(" + f + ")", i).width(h);
                                if (a.isFunction(b.p.orgEvents.resizeStop)) b.p.orgEvents.resizeStop.call(b, h, f);
                                else b.p.orgEvents.resizeStop = null
                            };
                            b.p.orgEvents.onSortCol = a.isFunction(b.p.onSortCol) ? b.p.onSortCol: null;
                            b.p.onSortCol = function(h, f, i) {
                                var m = a("tr.ui-jqgrid-labels:last th:eq(" + b.p.lastsort + ")", b.grid.fhDiv),
                                n = a("tr.ui-jqgrid-labels:last th:eq(" + f + ")", b.grid.fhDiv);
                                a("span.ui-grid-ico-sort", m).addClass("ui-state-disabled");
                                a(m).attr("aria-selected", "false");
                                a("span.ui-icon-" + b.p.sortorder, n).removeClass("ui-state-disabled");
                                a(n).attr("aria-selected", "true");
                                if (!b.p.viewsortcols[0]) if (b.p.lastsort != f) {
                                    a("span.s-ico", m).hide();
                                    a("span.s-ico", n).show()
                                }
                                a.isFunction(b.p.orgEvents.onSortCol) && b.p.orgEvents.onSortCol.call(b, h, f, i)
                            };
                            a("#gview_" + a.jgrid.jqID(b.p.id)).append(b.grid.fbDiv);
                            jQuery(b.grid.bDiv).scroll(function() {
                                jQuery(b.grid.fbDiv).scrollTop(jQuery(this).scrollTop())
                            });
                            b.p.orgEvents.complete = a.isFunction(b.p._complete) ? b.p._complete: null;
                            b.p.hoverrows === true && a("#" + a.jgrid.jqID(b.p.id)).unbind("mouseover").unbind("mouseout");
                            b.p._complete = function() {
                                a("#" + a.jgrid.jqID(b.p.id) + "_frozen").remove();
                                jQuery(b.grid.fbDiv).height(jQuery(b.grid.bDiv).height() - 16);
                                var h = a("#" + a.jgrid.jqID(b.p.id)).clone(true);
                                a("tr", h).each(function() {
                                    a("td:gt(" + k + ")", this).remove()
                                });
                                a(h).width(1).attr("id", a.jgrid.jqID(b.p.id) + "_frozen");
                                a(b.grid.fbDiv).append(h);
                                if (b.p.hoverrows === true) {
                                    a("tr.jqgrow", h).hover(function() {
                                        a(this).addClass("ui-state-hover");
                                        a("#" + a.jgrid.jqID(this.id), "#" + a.jgrid.jqID(b.p.id)).addClass("ui-state-hover")
                                    },
                                    function() {
                                        a(this).removeClass("ui-state-hover");
                                        a("#" + a.jgrid.jqID(this.id), "#" + a.jgrid.jqID(b.p.id)).removeClass("ui-state-hover")
                                    });
                                    a("tr.jqgrow", "#" + a.jgrid.jqID(b.p.id)).hover(function() {
                                        a(this).addClass("ui-state-hover");
                                        a("#" + a.jgrid.jqID(this.id), "#" + a.jgrid.jqID(b.p.id) + "_frozen").addClass("ui-state-hover")
                                    },
                                    function() {
                                        a(this).removeClass("ui-state-hover");
                                        a("#" + a.jgrid.jqID(this.id), "#" + a.jgrid.jqID(b.p.id) + "_frozen").removeClass("ui-state-hover")
                                    })
                                }
                                h = null;
                                a.isFunction(b.p.orgEvents.complete) && b.p.orgEvents.complete.call(b)
                            };
                            b.p.frozenColumns = true
                        }
                    }
                }
            })
        },
        destroyFrozenColumns: function() {
            return this.each(function() {
                if (this.grid) if (this.p.frozenColumns === true) {
                    a(this.grid.fhDiv).remove();
                    a(this.grid.fbDiv).remove();
                    this.grid.fhDiv = null;
                    this.grid.fbDiv = null;
                    this.p._complete = this.p.orgEvents.complete;
                    this.p.resizeStop = this.p.orgEvents.resizeStop;
                    this.p.onSortCol = this.p.orgEvents.onSortCol;
                    this.p.orgEvents = null;
                    if (this.p.hoverrows == true) {
                        var b;
                        a("#" + a.jgrid.jqID(this.p.id)).bind("mouseover",
                        function(e) {
                            b = a(e.target).closest("tr.jqgrow");
                            a(b).attr("class") !== "ui-subgrid" && a(b).addClass("ui-state-hover")
                        }).bind("mouseout",
                        function(e) {
                            b = a(e.target).closest("tr.jqgrow");
                            a(b).removeClass("ui-state-hover")
                        })
                    }
                    this.p.frozenColumns = false
                }
            })
        }
    })
})(jQuery); (function(a) {
    a.extend(a.jgrid, {
        showModal: function(b) {
            b.w.show()
        },
        closeModal: function(b) {
            b.w.hide().attr("aria-hidden", "true");
            b.o && b.o.remove()
        },
        hideModal: function(b, c) {
            c = a.extend({
                jqm: true,
                gb: ""
            },
            c || {});
            if (c.onClose) {
                var d = c.onClose(b);
                if (typeof d == "boolean" && !d) return
            }
            if (a.fn.jqm && c.jqm === true) a(b).attr("aria-hidden", "true").jqmHide();
            else {
                if (c.gb !== "") try {
                    a(".jqgrid-overlay:first", c.gb).hide()
                } catch(f) {}
                a(b).hide().attr("aria-hidden", "true")
            }
        },
        findPos: function(b) {
            var c = 0,
            d = 0;
            if (b.offsetParent) {
                do {
                    c += b.offsetLeft;
                    d += b.offsetTop
                } while ( b = b . offsetParent )
            }
            return [c, d]
        },
        createModal: function(b, c, d, f, g, h, j) {
            var e = document.createElement("div"),
            k,
            q = this;
            j = a.extend({},
            j || {});
            k = a(d.gbox).attr("dir") == "rtl" ? true: false;
            e.className = "ui-widget ui-widget-content ui-corner-all ui-jqdialog";
            e.id = b.themodal;
            var i = document.createElement("div");
            i.className = "ui-jqdialog-titlebar ui-widget-header ui-corner-all ui-helper-clearfix";
            i.id = b.modalhead;
            a(i).append("<span class='ui-jqdialog-title'>" + d.caption + "</span>");
            var n = a("<a href='javascript:void(0)' class='ui-jqdialog-titlebar-close ui-corner-all'></a>").hover(function() {
                n.addClass("ui-state-hover")
            },
            function() {
                n.removeClass("ui-state-hover")
            }).append("<span class='ui-icon ui-icon-closethick'></span>");
            a(i).append(n);
            if (k) {
                e.dir = "rtl";
                a(".ui-jqdialog-title", i).css("float", "right");
                a(".ui-jqdialog-titlebar-close", i).css("left", "0.3em")
            } else {
                e.dir = "ltr";
                a(".ui-jqdialog-title", i).css("float", "left");
                a(".ui-jqdialog-titlebar-close", i).css("right", "0.3em")
            }
            var r = document.createElement("div");
            a(r).addClass("ui-jqdialog-content ui-widget-content").attr("id", b.modalcontent);
            a(r).append(c);
            e.appendChild(r);
            a(e).prepend(i);
            if (h === true) a("body").append(e);
            else typeof h == "string" ? a(h).append(e) : a(e).insertBefore(f);
            a(e).css(j);
            if (typeof d.jqModal === "undefined") d.jqModal = true;
            c = {};
            if (a.fn.jqm && d.jqModal === true) {
                if (d.left === 0 && d.top === 0 && d.overlay) {
                    j = [];
                    j = this.findPos(g);
                    d.left = j[0] + 4;
                    d.top = j[1] + 4
                }
                c.top = d.top + "px";
                c.left = d.left
            } else if (d.left !== 0 || d.top !== 0) {
                c.left = d.left;
                c.top = d.top + "px"
            }
            a("a.ui-jqdialog-titlebar-close", i).click(function() {
                var o = a("#" + b.themodal).data("onClose") || d.onClose,
                s = a("#" + b.themodal).data("gbox") || d.gbox;
                q.hideModal("#" + b.themodal, {
                    gb: s,
                    jqm: d.jqModal,
                    onClose: o
                });
                return false
            });
            if (d.width === 0 || !d.width) d.width = 300;
            if (d.height === 0 || !d.height) d.height = 200;
            if (!d.zIndex) {
                f = a(f).parents("*[role=dialog]").filter(":first").css("z-index");
                d.zIndex = f ? parseInt(f, 10) + 2 : 950
            }
            f = 0;
            if (k && c.left && !h) {
                f = a(d.gbox).width() - (!isNaN(d.width) ? parseInt(d.width, 10) : 0) - 8;
                c.left = parseInt(c.left, 10) + parseInt(f, 10)
            }
            if (c.left) c.left += "px";
            a(e).css(a.extend({
                width: isNaN(d.width) ? "auto": d.width + "px",
                height: isNaN(d.height) ? "auto": d.height + "px",
                zIndex: d.zIndex,
                overflow: "hidden"
            },
            c)).attr({
                tabIndex: "-1",
                role: "dialog",
                "aria-labelledby": b.modalhead,
                "aria-hidden": "true"
            });
            if (typeof d.drag == "undefined") d.drag = true;
            if (typeof d.resize == "undefined") d.resize = true;
            if (d.drag) {
                a(i).css("cursor", "move");
                if (a.fn.jqDrag) a(e).jqDrag(i);
                else try {
                    a(e).draggable({
                        handle: a("#" + i.id)
                    })
                } catch(m) {}
            }
            if (d.resize) if (a.fn.jqResize) {
                a(e).append("<div class='jqResize ui-resizable-handle ui-resizable-se ui-icon ui-icon-gripsmall-diagonal-se ui-icon-grip-diagonal-se'></div>");
                a("#" + b.themodal).jqResize(".jqResize", b.scrollelm ? "#" + b.scrollelm: false)
            } else try {
                a(e).resizable({
                    handles: "se, sw",
                    alsoResize: b.scrollelm ? "#" + b.scrollelm: false
                })
            } catch(l) {}
            d.closeOnEscape === true && a(e).keydown(function(o) {
                if (o.which == 27) {
                    o = a("#" + b.themodal).data("onClose") || d.onClose;
                    q.hideModal(this, {
                        gb: d.gbox,
                        jqm: d.jqModal,
                        onClose: o
                    })
                }
            })
        },
        viewModal: function(b, c) {
            c = a.extend({
                toTop: true,
                overlay: 10,
                modal: false,
                overlayClass: "ui-widget-overlay",
                onShow: this.showModal,
                onHide: this.closeModal,
                gbox: "",
                jqm: true,
                jqM: true
            },
            c || {});
            if (a.fn.jqm && c.jqm === true) c.jqM ? a(b).attr("aria-hidden", "false").jqm(c).jqmShow() : a(b).attr("aria-hidden", "false").jqmShow();
            else {
                if (c.gbox !== "") {
                    a(".jqgrid-overlay:first", c.gbox).show();
                    a(b).data("gbox", c.gbox)
                }
                a(b).show().attr("aria-hidden", "false");
                try {
                    a(":input:visible", b)[0].focus()
                } catch(d) {}
            }
        },
        info_dialog: function(b, c, d, f) {
            var g = {
                width: 290,
                height: "auto",
                dataheight: "auto",
                drag: true,
                resize: false,
                caption: "<b>" + b + "</b>",
                left: 250,
                top: 170,
                zIndex: 1E3,
                jqModal: true,
                modal: false,
                closeOnEscape: true,
                align: "center",
                buttonalign: "center",
                buttons: []
            };
            a.extend(g, f || {});
            var h = g.jqModal,
            j = this;
            if (a.fn.jqm && !h) h = false;
            b = "";
            if (g.buttons.length > 0) for (f = 0; f < g.buttons.length; f++) {
                if (typeof g.buttons[f].id == "undefined") g.buttons[f].id = "info_button_" + f;
                b += "<a href='javascript:void(0)' id='" + g.buttons[f].id + "' class='fm-button ui-state-default ui-corner-all'>" + g.buttons[f].text + "</a>"
            }
            f = isNaN(g.dataheight) ? g.dataheight: g.dataheight + "px";
            var e = "<div id='info_id'>";
            e += "<div id='infocnt' style='margin:0px;padding-bottom:1em;width:100%;overflow:auto;position:relative;height:" + f + ";" + ("text-align:" + g.align + ";") + "'>" + c + "</div>";
            e += d ? "<div class='ui-widget-content ui-helper-clearfix' style='text-align:" + g.buttonalign + ";padding-bottom:0.8em;padding-top:0.5em;background-image: none;border-width: 1px 0 0 0;'><a href='javascript:void(0)' id='closedialog' class='fm-button ui-state-default ui-corner-all'>" + d + "</a>" + b + "</div>": b !== "" ? "<div class='ui-widget-content ui-helper-clearfix' style='text-align:" + g.buttonalign + ";padding-bottom:0.8em;padding-top:0.5em;background-image: none;border-width: 1px 0 0 0;'>" + b + "</div>": "";
            e += "</div>";
            try {
                a("#info_dialog").attr("aria-hidden") == "false" && this.hideModal("#info_dialog", {
                    jqm: h
                });
                a("#info_dialog").remove()
            } catch(k) {}
            this.createModal({
                themodal: "info_dialog",
                modalhead: "info_head",
                modalcontent: "info_content",
                scrollelm: "infocnt"
            },
            e, g, "", "", true);
            b && a.each(g.buttons,
            function(i) {
                a("#" + this.id, "#info_id").bind("click",
                function() {
                    g.buttons[i].onClick.call(a("#info_dialog"));
                    return false
                })
            });
            a("#closedialog", "#info_id").click(function() {
                j.hideModal("#info_dialog", {
                    jqm: h
                });
                return false
            });
            a(".fm-button", "#info_dialog").hover(function() {
                a(this).addClass("ui-state-hover")
            },
            function() {
                a(this).removeClass("ui-state-hover")
            });
            a.isFunction(g.beforeOpen) && g.beforeOpen();
            this.viewModal("#info_dialog", {
                onHide: function(i) {
                    i.w.hide().remove();
                    i.o && i.o.remove()
                },
                modal: g.modal,
                jqm: h
            });
            a.isFunction(g.afterOpen) && g.afterOpen();
            try {
                a("#info_dialog").focus()
            } catch(q) {}
        },
        createEl: function(b, c, d, f, g) {
            function h(m, l) {
                a.isFunction(l.dataInit) && l.dataInit(m);
                l.dataEvents && a.each(l.dataEvents,
                function() {
                    this.data !== undefined ? a(m).bind(this.type, this.data, this.fn) : a(m).bind(this.type, this.fn)
                });
                return l
            }
            function j(m, l, o) {
                var s = ["dataInit", "dataEvents", "dataUrl", "buildSelect", "sopt", "searchhidden", "defaultValue", "attr"];
                if (typeof o != "undefined" && a.isArray(o)) s = a.extend(s, o);
                a.each(l,
                function(p, t) {
                    a.inArray(p, s) === -1 && a(m).attr(p, t)
                });
                l.hasOwnProperty("id") || a(m).attr("id", a.jgrid.randId())
            }
            var e = "";
            switch (b) {
            case "textarea":
                e = document.createElement("textarea");
                if (f) c.cols || a(e).css({
                    width: "98%"
                });
                else if (!c.cols) c.cols = 20;
                if (!c.rows) c.rows = 2;
                if (d == "&nbsp;" || d == "&#160;" || d.length == 1 && d.charCodeAt(0) == 160) d = "";
                e.value = d;
                j(e, c);
                c = h(e, c);
                a(e).attr({
                    role: "textbox",
                    multiline: "true"
                });
                break;
            case "checkbox":
                e = document.createElement("input");
                e.type = "checkbox";
                if (c.value) {
                    b = c.value.split(":");
                    if (d === b[0]) {
                        e.checked = true;
                        e.defaultChecked = true
                    }
                    e.value = b[0];
                    a(e).attr("offval", b[1])
                } else {
                    b = d.toLowerCase();
                    if (b.search(/(false|0|no|off|undefined)/i) < 0 && b !== "") {
                        e.checked = true;
                        e.defaultChecked = true;
                        e.value = d
                    } else e.value = "on";
                    a(e).attr("offval", "off")
                }
                j(e, c, ["value"]);
                c = h(e, c);
                a(e).attr("role", "checkbox");
                break;
            case "select":
                e = document.createElement("select");
                e.setAttribute("role", "select");
                f = [];
                if (c.multiple === true) {
                    b = true;
                    e.multiple = "multiple";
                    a(e).attr("aria-multiselectable", "true")
                } else b = false;
                if (typeof c.dataUrl != "undefined") a.ajax(a.extend({
                    url: c.dataUrl,
                    type: "GET",
                    dataType: "html",
                    context: {
                        elem: e,
                        options: c,
                        vl: d
                    },
                    success: function(m) {
                        var l = [],
                        o = this.elem,
                        s = this.vl,
                        p = a.extend({},
                        this.options),
                        t = p.multiple === true;
                        if (typeof p.buildSelect != "undefined") m = p.buildSelect(m);
                        if (m = a(m).html()) {
                            a(o).append(m);
                            j(o, p);
                            p = h(o, p);
                            if (typeof p.size === "undefined") p.size = t ? 3 : 1;
                            if (t) {
                                l = s.split(",");
                                l = a.map(l,
                                function(u) {
                                    return a.trim(u)
                                })
                            } else l[0] = a.trim(s);
                            setTimeout(function() {
                                a("option", o).each(function() {
                                    a(this).attr("role", "option");
                                    if (a.inArray(a.trim(a(this).text()), l) > -1 || a.inArray(a.trim(a(this).val()), l) > -1) this.selected = "selected"
                                })
                            },
                            0)
                        }
                    }
                },
                g || {}));
                else if (c.value) {
                    var k;
                    if (typeof c.size === "undefined") c.size = b ? 3 : 1;
                    if (b) {
                        f = d.split(",");
                        f = a.map(f,
                        function(m) {
                            return a.trim(m)
                        })
                    }
                    if (typeof c.value === "function") c.value = c.value();
                    var q, i, n = c.separator === undefined ? ":": c.separator;
                    if (typeof c.value === "string") {
                        q = c.value.split(";");
                        for (k = 0; k < q.length; k++) {
                            i = q[k].split(n);
                            if (i.length > 2) i[1] = a.map(i,
                            function(m, l) {
                                if (l > 0) return m
                            }).join(":");
                            g = document.createElement("option");
                            g.setAttribute("role", "option");
                            g.value = i[0];
                            g.innerHTML = i[1];
                            e.appendChild(g);
                            if (!b && (a.trim(i[0]) == a.trim(d) || a.trim(i[1]) == a.trim(d))) g.selected = "selected";
                            if (b && (a.inArray(a.trim(i[1]), f) > -1 || a.inArray(a.trim(i[0]), f) > -1)) g.selected = "selected"
                        }
                    } else if (typeof c.value === "object") {
                        n = c.value;
                        for (k in n) if (n.hasOwnProperty(k)) {
                            g = document.createElement("option");
                            g.setAttribute("role", "option");
                            g.value = k;
                            g.innerHTML = n[k];
                            e.appendChild(g);
                            if (!b && (a.trim(k) == a.trim(d) || a.trim(n[k]) == a.trim(d))) g.selected = "selected";
                            if (b && (a.inArray(a.trim(n[k]), f) > -1 || a.inArray(a.trim(k), f) > -1)) g.selected = "selected"
                        }
                    }
                    j(e, c, ["value"]);
                    c = h(e, c)
                }
                break;
            case "text":
            case "password":
            case "button":
                k = b == "button" ? "button": "textbox";
                e = document.createElement("input");
                e.type = b;
                e.value = d;
                j(e, c);
                c = h(e, c);
                if (b != "button") if (f) c.size || a(e).css({
                    width: "98%"
                });
                else if (!c.size) c.size = 20;
                a(e).attr("role", k);
                break;
            case "image":
            case "file":
                e = document.createElement("input");
                e.type = b;
                j(e, c);
                c = h(e, c);
                break;
            case "custom":
                e = document.createElement("span");
                try {
                    if (a.isFunction(c.custom_element)) if (n = c.custom_element.call(this, d, c)) {
                        n = a(n).addClass("customelement").attr({
                            id: c.id,
                            name: c.name
                        });
                        a(e).empty().append(n)
                    } else throw "e2";
                    else throw "e1";
                } catch(r) {
                    r == "e1" && this.info_dialog(a.jgrid.errors.errcap, "function 'custom_element' " + a.jgrid.edit.msg.nodefined, a.jgrid.edit.bClose);
                    r == "e2" ? this.info_dialog(a.jgrid.errors.errcap, "function 'custom_element' " + a.jgrid.edit.msg.novalue, a.jgrid.edit.bClose) : this.info_dialog(a.jgrid.errors.errcap, typeof r === "string" ? r: r.message, a.jgrid.edit.bClose)
                }
            }
            return e
        },
        checkDate: function(b, c) {
            var d = {},
            f;
            b = b.toLowerCase();
            f = b.indexOf("/") != -1 ? "/": b.indexOf("-") != -1 ? "-": b.indexOf(".") != -1 ? ".": "/";
            b = b.split(f);
            c = c.split(f);
            if (c.length != 3) return false;
            f = -1;
            for (var g, h = -1,
            j = -1,
            e = 0; e < b.length; e++) {
                g = isNaN(c[e]) ? 0 : parseInt(c[e], 10);
                d[b[e]] = g;
                g = b[e];
                if (g.indexOf("y") != -1) f = e;
                if (g.indexOf("m") != -1) j = e;
                if (g.indexOf("d") != -1) h = e
            }
            g = b[f] == "y" || b[f] == "yyyy" ? 4 : b[f] == "yy" ? 2 : -1;
            e = function(q) {
                for (var i = 1; i <= q; i++) {
                    this[i] = 31;
                    if (i == 4 || i == 6 || i == 9 || i == 11) this[i] = 30;
                    if (i == 2) this[i] = 29
                }
                return this
            } (12);
            var k;
            if (f === -1) return false;
            else {
                k = d[b[f]].toString();
                if (g == 2 && k.length == 1) g = 1;
                if (k.length != g || d[b[f]] === 0 && c[f] != "00") return false
            }
            if (j === -1) return false;
            else {
                k = d[b[j]].toString();
                if (k.length < 1 || d[b[j]] < 1 || d[b[j]] > 12) return false
            }
            if (h === -1) return false;
            else {
                k = d[b[h]].toString();
                if (k.length < 1 || d[b[h]] < 1 || d[b[h]] > 31 || d[b[j]] == 2 && d[b[h]] > (d[b[f]] % 4 === 0 && (d[b[f]] % 100 !== 0 || d[b[f]] % 400 === 0) ? 29 : 28) || d[b[h]] > e[d[b[j]]]) return false
            }
            return true
        },
        isEmpty: function(b) {
            return b.match(/^\s+$/) || b === "" ? true: false
        },
        checkTime: function(b) {
            var c = /^(\d{1,2}):(\d{2})([ap]m)?$/;
            if (!this.isEmpty(b)) if (b = b.match(c)) {
                if (b[3]) {
                    if (b[1] < 1 || b[1] > 12) return false
                } else if (b[1] > 23) return false;
                if (b[2] > 59) return false
            } else return false;
            return true
        },
        checkValues: function(b, c, d, f, g) {
            var h, j;
            if (typeof f === "undefined") if (typeof c == "string") {
                f = 0;
                for (g = d.p.colModel.length; f < g; f++) if (d.p.colModel[f].name == c) {
                    h = d.p.colModel[f].editrules;
                    c = f;
                    try {
                        j = d.p.colModel[f].formoptions.label
                    } catch(e) {}
                    break
                }
            } else {
                if (c >= 0) h = d.p.colModel[c].editrules
            } else {
                h = f;
                j = g === undefined ? "_": g
            }
            if (h) {
                j || (j = d.p.colNames[c]);
                if (h.required === true) if (this.isEmpty(b)) return [false, j + ": " + a.jgrid.edit.msg.required, ""];
                f = h.required === false ? false: true;
                if (h.number === true) if (! (f === false && this.isEmpty(b))) if (isNaN(b)) return [false, j + ": " + a.jgrid.edit.msg.number, ""];
                if (typeof h.minValue != "undefined" && !isNaN(h.minValue)) if (parseFloat(b) < parseFloat(h.minValue)) return [false, j + ": " + a.jgrid.edit.msg.minValue + " " + h.minValue, ""];
                if (typeof h.maxValue != "undefined" && !isNaN(h.maxValue)) if (parseFloat(b) > parseFloat(h.maxValue)) return [false, j + ": " + a.jgrid.edit.msg.maxValue + " " + h.maxValue, ""];
                if (h.email === true) if (! (f === false && this.isEmpty(b))) {
                    g = /^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/i;
                    if (!g.test(b)) return [false, j + ": " + a.jgrid.edit.msg.email, ""]
                }
                if (h.integer === true) if (! (f === false && this.isEmpty(b))) {
                    if (isNaN(b)) return [false, j + ": " + a.jgrid.edit.msg.integer, ""];
                    if (b % 1 !== 0 || b.indexOf(".") != -1) return [false, j + ": " + a.jgrid.edit.msg.integer, ""]
                }
                if (h.date === true) if (! (f === false && this.isEmpty(b))) {
                    c = d.p.colModel[c].formatoptions && d.p.colModel[c].formatoptions.newformat ? d.p.colModel[c].formatoptions.newformat: d.p.colModel[c].datefmt || "Y-m-d";
                    if (!this.checkDate(c, b)) return [false, j + ": " + a.jgrid.edit.msg.date + " - " + c, ""]
                }
                if (h.time === true) if (! (f === false && this.isEmpty(b))) if (!this.checkTime(b)) return [false, j + ": " + a.jgrid.edit.msg.date + " - hh:mm (am/pm)", ""];
                if (h.url === true) if (! (f === false && this.isEmpty(b))) {
                    g = /^(((https?)|(ftp)):\/\/([\-\w]+\.)+\w{2,3}(\/[%\-\w]+(\.\w{2,})?)*(([\w\-\.\?\\\/+@&#;`~=%!]*)(\.\w{2,})?)*\/?)/i;
                    if (!g.test(b)) return [false, j + ": " + a.jgrid.edit.msg.url, ""]
                }
                if (h.custom === true) if (! (f === false && this.isEmpty(b))) if (a.isFunction(h.custom_func)) {
                    b = h.custom_func.call(d, b, j);
                    return a.isArray(b) ? b: [false, a.jgrid.edit.msg.customarray, ""]
                } else return [false, a.jgrid.edit.msg.customfcheck, ""]
            }
            return [true, "", ""]
        }
    })
})(jQuery); (function(a) {
    var d = {};
    a.jgrid.extend({
        searchGrid: function(f) {
            f = a.extend({
                recreateFilter: false,
                drag: true,
                sField: "searchField",
                sValue: "searchString",
                sOper: "searchOper",
                sFilter: "filters",
                loadDefaults: true,
                beforeShowSearch: null,
                afterShowSearch: null,
                onInitializeSearch: null,
                afterRedraw: null,
                closeAfterSearch: false,
                closeAfterReset: false,
                closeOnEscape: false,
                multipleSearch: false,
                multipleGroup: false,
                top: 0,
                left: 0,
                jqModal: true,
                modal: false,
                resize: true,
                width: 450,
                height: "auto",
                dataheight: "auto",
                showQuery: false,
                errorcheck: true,
                sopt: null,
                stringResult: undefined,
                onClose: null,
                onSearch: null,
                onReset: null,
                toTop: true,
                overlay: 30,
                columns: [],
                tmplNames: null,
                tmplFilters: null,
                tmplLabel: " Template: ",
                showOnLoad: false,
                layer: null
            },
            a.jgrid.search, f || {});
            return this.each(function() {
                function b() {
                    if (a.isFunction(f.beforeShowSearch)) {
                        x = f.beforeShowSearch(a("#" + q));
                        if (typeof x === "undefined") x = true
                    }
                    if (x) {
                        a.jgrid.viewModal("#" + G.themodal, {
                            gbox: "#gbox_" + q,
                            jqm: f.jqModal,
                            modal: f.modal,
                            overlay: f.overlay,
                            toTop: f.toTop
                        });
                        a.isFunction(f.afterShowSearch) && f.afterShowSearch(a("#" + q))
                    }
                }
                var e = this;
                if (e.grid) {
                    var q = "fbox_" + e.p.id,
                    x = true,
                    G = {
                        themodal: "searchmod" + q,
                        modalhead: "searchhd" + q,
                        modalcontent: "searchcnt" + q,
                        scrollelm: q
                    },
                    B = e.p.postData[f.sFilter];
                    if (typeof B === "string") B = a.jgrid.parse(B);
                    f.recreateFilter === true && a("#" + G.themodal).remove();
                    if (a("#" + G.themodal).html() !== null) b();
                    else {
                        var w = a("<div><div id='" + q + "' class='searchFilter' style='overflow:auto'></div></div>").insertBefore("#gview_" + e.p.id),
                        n = "left",
                        j = "";
                        if (e.p.direction == "rtl") {
                            n = "right";
                            j = " style='text-align:left'";
                            w.attr("dir", "rtl")
                        }
                        var s = a.extend([], e.p.colModel),
                        M = "<a href='javascript:void(0)' id='" + q + "_search' class='fm-button ui-state-default ui-corner-all fm-button-icon-right ui-reset'><span class='ui-icon ui-icon-search'></span>" + f.Find + "</a>",
                        c = "<a href='javascript:void(0)' id='" + q + "_reset' class='fm-button ui-state-default ui-corner-all fm-button-icon-left ui-search'><span class='ui-icon ui-icon-arrowreturnthick-1-w'></span>" + f.Reset + "</a>",
                        t = "",
                        o = "",
                        i,
                        m = false,
                        H = -1;
                        if (f.showQuery) t = "<a href='javascript:void(0)' id='" + q + "_query' class='fm-button ui-state-default ui-corner-all fm-button-icon-left'><span class='ui-icon ui-icon-comment'></span>Query</a>";
                        if (f.columns.length) s = f.columns;
                        else a.each(s,
                        function(u, C) {
                            if (!C.label) C.label = e.p.colNames[u];
                            if (!m) {
                                var A = typeof C.search === "undefined" ? true: C.search,
                                l = C.hidden === true;
                                if (C.searchoptions && C.searchoptions.searchhidden === true && A || A && !l) {
                                    m = true;
                                    i = C.index || C.name;
                                    H = u
                                }
                            }
                        });
                        if (!B && i || f.multipleSearch === false) {
                            var J = "eq";
                            if (H >= 0 && s[H].searchoptions && s[H].searchoptions.sopt) J = s[H].searchoptions.sopt[0];
                            else if (f.sopt && f.sopt.length) J = f.sopt[0];
                            B = {
                                groupOp: "AND",
                                rules: [{
                                    field: i,
                                    op: J,
                                    data: ""
                                }]
                            }
                        }
                        m = false;
                        if (f.tmplNames && f.tmplNames.length) {
                            m = true;
                            o = f.tmplLabel;
                            o += "<select class='ui-template'>";
                            o += "<option value='default'>Default</option>";
                            a.each(f.tmplNames,
                            function(u, C) {
                                o += "<option value='" + u + "'>" + C + "</option>"
                            });
                            o += "</select>"
                        }
                        n = "<table class='EditTable' style='border:0px none;margin-top:5px' id='" + q + "_2'><tbody><tr><td colspan='2'><hr class='ui-widget-content' style='margin:1px'/></td></tr><tr><td class='EditButton' style='text-align:" + n + "'>" + c + o + "</td><td class='EditButton' " + j + ">" + t + M + "</td></tr></tbody></table>";
                        a("#" + q).jqFilter({
                            columns: s,
                            filter: f.loadDefaults ? B: null,
                            showQuery: f.showQuery,
                            errorcheck: f.errorcheck,
                            sopt: f.sopt,
                            groupButton: f.multipleGroup,
                            ruleButtons: f.multipleSearch,
                            afterRedraw: f.afterRedraw,
                            _gridsopt: a.jgrid.search.odata,
                            ajaxSelectOptions: e.p.ajaxSelectOptions,
                            onChange: function() {
                                this.p.showQuery && a(".query", this).html(this.toUserFriendlyString())
                            },
                            direction: e.p.direction
                        });
                        w.append(n);
                        m && f.tmplFilters && f.tmplFilters.length && a(".ui-template", w).bind("change",
                        function() {
                            var u = a(this).val();
                            u == "default" ? a("#" + q).jqFilter("addFilter", B) : a("#" + q).jqFilter("addFilter", f.tmplFilters[parseInt(u, 10)]);
                            return false
                        });
                        if (f.multipleGroup === true) f.multipleSearch = true;
                        if (a.isFunction(f.onInitializeSearch)) f.onInitializeSearch(a("#" + q));
                        f.gbox = "#gbox_" + q;
                        f.layer ? a.jgrid.createModal(G, w, f, "#gview_" + e.p.id, a("#gbox_" + e.p.id)[0], "#" + f.layer, {
                            position: "relative"
                        }) : a.jgrid.createModal(G, w, f, "#gview_" + e.p.id, a("#gbox_" + e.p.id)[0]);
                        t && a("#" + q + "_query").bind("click",
                        function() {
                            a(".queryresult", w).toggle();
                            return false
                        });
                        if (f.stringResult === undefined) f.stringResult = f.multipleSearch;
                        a("#" + q + "_search").bind("click",
                        function() {
                            var u = a("#" + q),
                            C = {},
                            A,
                            l = u.jqFilter("filterData");
                            if (f.errorcheck) {
                                u[0].hideError();
                                f.showQuery || u.jqFilter("toSQLString");
                                if (u[0].p.error) {
                                    u[0].showError();
                                    return false
                                }
                            }
                            if (f.stringResult) {
                                try {
                                    A = xmlJsonClass.toJson(l, "", "", false)
                                } catch(y) {
                                    try {
                                        A = JSON.stringify(l)
                                    } catch(h) {}
                                }
                                if (typeof A === "string") {
                                    C[f.sFilter] = A;
                                    a.each([f.sField, f.sValue, f.sOper],
                                    function() {
                                        C[this] = ""
                                    })
                                }
                            } else if (f.multipleSearch) {
                                C[f.sFilter] = l;
                                a.each([f.sField, f.sValue, f.sOper],
                                function() {
                                    C[this] = ""
                                })
                            } else {
                                C[f.sField] = l.rules[0].field;
                                C[f.sValue] = l.rules[0].data;
                                C[f.sOper] = l.rules[0].op;
                                C[f.sFilter] = ""
                            }
                            e.p.search = true;
                            a.extend(e.p.postData, C);
                            if (a.isFunction(f.onSearch)) f.onSearch();
                            a(e).trigger("reloadGrid", [{
                                page: 1
                            }]);
                            f.closeAfterSearch && a.jgrid.hideModal("#" + G.themodal, {
                                gb: "#gbox_" + e.p.id,
                                jqm: f.jqModal,
                                onClose: f.onClose
                            });
                            return false
                        });
                        a("#" + q + "_reset").bind("click",
                        function() {
                            var u = {},
                            C = a("#" + q);
                            e.p.search = false;
                            if (f.multipleSearch === false) u[f.sField] = u[f.sValue] = u[f.sOper] = "";
                            else u[f.sFilter] = "";
                            C[0].resetFilter();
                            m && a(".ui-template", w).val("default");
                            a.extend(e.p.postData, u);
                            if (a.isFunction(f.onReset)) f.onReset();
                            a(e).trigger("reloadGrid", [{
                                page: 1
                            }]);
                            return false
                        });
                        b();
                        a(".fm-button:not(.ui-state-disabled)", w).hover(function() {
                            a(this).addClass("ui-state-hover")
                        },
                        function() {
                            a(this).removeClass("ui-state-hover")
                        })
                    }
                }
            })
        },
        editGridRow: function(f, b) {
            b = a.extend({
                top: 0,
                left: 0,
                width: 300,
                height: "auto",
                dataheight: "auto",
                modal: false,
                overlay: 30,
                drag: true,
                resize: true,
                url: null,
                mtype: "POST",
                clearAfterAdd: true,
                closeAfterEdit: false,
                reloadAfterSubmit: true,
                onInitializeForm: null,
                beforeInitData: null,
                beforeShowForm: null,
                afterShowForm: null,
                beforeSubmit: null,
                afterSubmit: null,
                onclickSubmit: null,
                afterComplete: null,
                onclickPgButtons: null,
                afterclickPgButtons: null,
                editData: {},
                recreateForm: false,
                jqModal: true,
                closeOnEscape: false,
                addedrow: "first",
                topinfo: "",
                bottominfo: "",
                saveicon: [],
                closeicon: [],
                savekey: [false, 13],
                navkeys: [false, 38, 40],
                checkOnSubmit: false,
                checkOnUpdate: false,
                _savedData: {},
                processing: false,
                onClose: null,
                ajaxEditOptions: {},
                serializeEditData: null,
                viewPagerButtons: true
            },
            a.jgrid.edit, b || {});
            d[a(this)[0].p.id] = b;
            return this.each(function() {
                function e() {
                    a("#" + i + " > tbody > tr > td > .FormElement").each(function() {
                        var g = a(".customelement", this);
                        if (g.length) {
                            var k = a(g[0]).attr("name");
                            a.each(c.p.colModel,
                            function() {
                                if (this.name === k && this.editoptions && a.isFunction(this.editoptions.custom_value)) {
                                    try {
                                        h[k] = this.editoptions.custom_value(a("#" + a.jgrid.jqID(k), "#" + i), "get");
                                        if (h[k] === undefined) throw "e1";
                                    } catch(p) {
                                        p === "e1" ? a.jgrid.info_dialog(jQuery.jgrid.errors.errcap, "function 'custom_value' " + a.jgrid.edit.msg.novalue, jQuery.jgrid.edit.bClose) : a.jgrid.info_dialog(jQuery.jgrid.errors.errcap, p.message, jQuery.jgrid.edit.bClose)
                                    }
                                    return true
                                }
                            })
                        } else {
                            switch (a(this).get(0).type) {
                            case "checkbox":
                                if (a(this).is(":checked")) h[this.name] = a(this).val();
                                else {
                                    g = a(this).attr("offval");
                                    h[this.name] = g
                                }
                                break;
                            case "select-one":
                                h[this.name] = a("option:selected", this).val();
                                O[this.name] = a("option:selected", this).text();
                                break;
                            case "select-multiple":
                                h[this.name] = a(this).val();
                                h[this.name] = h[this.name] ? h[this.name].join(",") : "";
                                var v = [];
                                a("option:selected", this).each(function(p, E) {
                                    v[p] = a(E).text()
                                });
                                O[this.name] = v.join(",");
                                break;
                            case "password":
                            case "text":
                            case "textarea":
                            case "button":
                                h[this.name] = a(this).val()
                            }
                            if (c.p.autoencode) h[this.name] = a.jgrid.htmlEncode(h[this.name])
                        }
                    });
                    return true
                }
                function q(g, k, v, p) {
                    var E, D, z, L = 0,
                    r, R, F, T = [],
                    I = false,
                    ca = "",
                    P;
                    for (P = 1; P <= p; P++) ca += "<td class='CaptionTD'>&#160;</td><td class='DataTD'>&#160;</td>";
                    if (g != "_empty") I = a(k).jqGrid("getInd", g);
                    a(k.p.colModel).each(function(S) {
                        E = this.name;
                        R = (D = this.editrules && this.editrules.edithidden === true ? false: this.hidden === true ? true: false) ? "style='display:none'": "";
                        if (E !== "cb" && E !== "subgrid" && this.editable === true && E !== "rn") {
                            if (I === false) r = "";
                            else if (E == k.p.ExpandColumn && k.p.treeGrid === true) r = a("td:eq(" + S + ")", k.rows[I]).text();
                            else {
                                try {
                                    r = a.unformat(a("td:eq(" + S + ")", k.rows[I]), {
                                        rowId: g,
                                        colModel: this
                                    },
                                    S)
                                } catch(ea) {
                                    r = this.edittype && this.edittype == "textarea" ? a("td:eq(" + S + ")", k.rows[I]).text() : a("td:eq(" + S + ")", k.rows[I]).html()
                                }
                                if (!r || r == "&nbsp;" || r == "&#160;" || r.length == 1 && r.charCodeAt(0) == 160) r = ""
                            }
                            var X = a.extend({},
                            this.editoptions || {},
                            {
                                id: E,
                                name: E
                            }),
                            Y = a.extend({},
                            {
                                elmprefix: "",
                                elmsuffix: "",
                                rowabove: false,
                                rowcontent: ""
                            },
                            this.formoptions || {}),
                            da = parseInt(Y.rowpos, 10) || L + 1,
                            fa = parseInt((parseInt(Y.colpos, 10) || 1) * 2, 10);
                            if (g == "_empty" && X.defaultValue) r = a.isFunction(X.defaultValue) ? X.defaultValue() : X.defaultValue;
                            if (!this.edittype) this.edittype = "text";
                            if (c.p.autoencode) r = a.jgrid.htmlDecode(r);
                            F = a.jgrid.createEl(this.edittype, X, r, false, a.extend({},
                            a.jgrid.ajaxOptions, k.p.ajaxSelectOptions || {}));
                            if (r === "" && this.edittype == "checkbox") r = a(F).attr("offval");
                            if (r === "" && this.edittype == "select") r = a("option:eq(0)", F).text();
                            if (d[c.p.id].checkOnSubmit || d[c.p.id].checkOnUpdate) d[c.p.id]._savedData[E] = r;
                            a(F).addClass("FormElement");
                            if (this.edittype == "text" || this.edittype == "textarea") a(F).addClass("ui-widget-content ui-corner-all");
                            z = a(v).find("tr[rowpos=" + da + "]");
                            if (Y.rowabove) {
                                X = a("<tr><td class='contentinfo' colspan='" + p * 2 + "'>" + Y.rowcontent + "</td></tr>");
                                a(v).append(X);
                                X[0].rp = da
                            }
                            if (z.length === 0) {
                                z = a("<tr " + R + " rowpos='" + da + "'></tr>").addClass("FormData").attr("id", "tr_" + E);
                                a(z).append(ca);
                                a(v).append(z);
                                z[0].rp = da
                            }
                            a("td:eq(" + (fa - 2) + ")", z[0]).html(typeof Y.label === "undefined" ? k.p.colNames[S] : Y.label);
                            a("td:eq(" + (fa - 1) + ")", z[0]).append(Y.elmprefix).append(F).append(Y.elmsuffix);
                            T[L] = S;
                            L++
                        }
                    });
                    if (L > 0) {
                        P = a("<tr class='FormData' style='display:none'><td class='CaptionTD'></td><td colspan='" + (p * 2 - 1) + "' class='DataTD'><input class='FormElement' id='id_g' type='text' name='" + k.p.id + "_id' value='" + g + "'/></td></tr>");
                        P[0].rp = L + 999;
                        a(v).append(P);
                        if (d[c.p.id].checkOnSubmit || d[c.p.id].checkOnUpdate) d[c.p.id]._savedData[k.p.id + "_id"] = g
                    }
                    return T
                }
                function x(g, k, v) {
                    var p, E = 0,
                    D, z, L, r, R;
                    if (d[c.p.id].checkOnSubmit || d[c.p.id].checkOnUpdate) {
                        d[c.p.id]._savedData = {};
                        d[c.p.id]._savedData[k.p.id + "_id"] = g
                    }
                    var F = k.p.colModel;
                    if (g == "_empty") {
                        a(F).each(function() {
                            p = this.name;
                            L = a.extend({},
                            this.editoptions || {});
                            if ((z = a("#" + a.jgrid.jqID(p), "#" + v)) && z.length && z[0] !== null) {
                                r = "";
                                if (L.defaultValue) {
                                    r = a.isFunction(L.defaultValue) ? L.defaultValue() : L.defaultValue;
                                    if (z[0].type == "checkbox") {
                                        R = r.toLowerCase();
                                        if (R.search(/(false|0|no|off|undefined)/i) < 0 && R !== "") {
                                            z[0].checked = true;
                                            z[0].defaultChecked = true;
                                            z[0].value = r
                                        } else {
                                            z[0].checked = false;
                                            z[0].defaultChecked = false
                                        }
                                    } else z.val(r)
                                } else if (z[0].type == "checkbox") {
                                    z[0].checked = false;
                                    z[0].defaultChecked = false;
                                    r = a(z).attr("offval")
                                } else if (z[0].type && z[0].type.substr(0, 6) == "select") z[0].selectedIndex = 0;
                                else z.val(r);
                                if (d[c.p.id].checkOnSubmit === true || d[c.p.id].checkOnUpdate) d[c.p.id]._savedData[p] = r
                            }
                        });
                        a("#id_g", "#" + v).val(g)
                    } else {
                        var T = a(k).jqGrid("getInd", g, true);
                        if (T) {
                            a('td[role="gridcell"]', T).each(function(I) {
                                p = F[I].name;
                                if (p !== "cb" && p !== "subgrid" && p !== "rn" && F[I].editable === true) {
                                    if (p == k.p.ExpandColumn && k.p.treeGrid === true) D = a(this).text();
                                    else try {
                                        D = a.unformat(a(this), {
                                            rowId: g,
                                            colModel: F[I]
                                        },
                                        I)
                                    } catch(ca) {
                                        D = F[I].edittype == "textarea" ? a(this).text() : a(this).html()
                                    }
                                    if (c.p.autoencode) D = a.jgrid.htmlDecode(D);
                                    if (d[c.p.id].checkOnSubmit === true || d[c.p.id].checkOnUpdate) d[c.p.id]._savedData[p] = D;
                                    p = a.jgrid.jqID(p);
                                    switch (F[I].edittype) {
                                    case "password":
                                    case "text":
                                    case "button":
                                    case "image":
                                    case "textarea":
                                        if (D == "&nbsp;" || D == "&#160;" || D.length == 1 && D.charCodeAt(0) == 160) D = "";
                                        a("#" + p, "#" + v).val(D);
                                        break;
                                    case "select":
                                        var P = D.split(",");
                                        P = a.map(P,
                                        function(ea) {
                                            return a.trim(ea)
                                        });
                                        a("#" + p + " option", "#" + v).each(function() {
                                            this.selected = !F[I].editoptions.multiple && (a.trim(D) == a.trim(a(this).text()) || P[0] == a.trim(a(this).text()) || P[0] == a.trim(a(this).val())) ? true: F[I].editoptions.multiple ? a.inArray(a.trim(a(this).text()), P) > -1 || a.inArray(a.trim(a(this).val()), P) > -1 ? true: false: false
                                        });
                                        break;
                                    case "checkbox":
                                        D += "";
                                        if (F[I].editoptions && F[I].editoptions.value) if (F[I].editoptions.value.split(":")[0] == D) {
                                            a("#" + p, "#" + v)[c.p.useProp ? "prop": "attr"]("checked", true);
                                            a("#" + p, "#" + v)[c.p.useProp ? "prop": "attr"]("defaultChecked", true)
                                        } else {
                                            a("#" + p, "#" + v)[c.p.useProp ? "prop": "attr"]("checked", false);
                                            a("#" + p, "#" + v)[c.p.useProp ? "prop": "attr"]("defaultChecked", false)
                                        } else {
                                            D = D.toLowerCase();
                                            if (D.search(/(false|0|no|off|undefined)/i) < 0 && D !== "") {
                                                a("#" + p, "#" + v)[c.p.useProp ? "prop": "attr"]("checked", true);
                                                a("#" + p, "#" + v)[c.p.useProp ? "prop": "attr"]("defaultChecked", true)
                                            } else {
                                                a("#" + p, "#" + v)[c.p.useProp ? "prop": "attr"]("checked", false);
                                                a("#" + p, "#" + v)[c.p.useProp ? "prop": "attr"]("defaultChecked", false)
                                            }
                                        }
                                        break;
                                    case "custom":
                                        try {
                                            if (F[I].editoptions && a.isFunction(F[I].editoptions.custom_value)) F[I].editoptions.custom_value(a("#" + p, "#" + v), "set", D);
                                            else throw "e1";
                                        } catch(S) {
                                            S == "e1" ? a.jgrid.info_dialog(jQuery.jgrid.errors.errcap, "function 'custom_value' " + a.jgrid.edit.msg.nodefined, jQuery.jgrid.edit.bClose) : a.jgrid.info_dialog(jQuery.jgrid.errors.errcap, S.message, jQuery.jgrid.edit.bClose)
                                        }
                                    }
                                    E++
                                }
                            });
                            E > 0 && a("#id_g", "#" + i).val(g)
                        }
                    }
                }
                function G() {
                    a.each(c.p.colModel,
                    function(g, k) {
                        if (k.editoptions && k.editoptions.NullIfEmpty === true) if (h.hasOwnProperty(k.name) && h[k.name] === "") h[k.name] = "null"
                    })
                }
                function B() {
                    var g, k = [true, "", ""],
                    v = {},
                    p = c.p.prmNames,
                    E,
                    D,
                    z,
                    L,
                    r;
                    if (a.isFunction(d[c.p.id].beforeCheckValues)) {
                        var R = d[c.p.id].beforeCheckValues(h, a("#" + o), h[c.p.id + "_id"] == "_empty" ? p.addoper: p.editoper);
                        if (R && typeof R === "object") h = R
                    }
                    for (z in h) if (h.hasOwnProperty(z)) {
                        k = a.jgrid.checkValues(h[z], z, c);
                        if (k[0] === false) break
                    }
                    G();
                    if (k[0]) {
                        if (a.isFunction(d[c.p.id].onclickSubmit)) v = d[c.p.id].onclickSubmit(d[c.p.id], h) || {};
                        if (a.isFunction(d[c.p.id].beforeSubmit)) k = d[c.p.id].beforeSubmit(h, a("#" + o))
                    }
                    if (k[0] && !d[c.p.id].processing) {
                        d[c.p.id].processing = true;
                        a("#sData", "#" + i + "_2").addClass("ui-state-active");
                        D = p.oper;
                        E = p.id;
                        h[D] = a.trim(h[c.p.id + "_id"]) == "_empty" ? p.addoper: p.editoper;
                        if (h[D] != p.addoper) h[E] = h[c.p.id + "_id"];
                        else if (h[E] === undefined) h[E] = h[c.p.id + "_id"];
                        delete h[c.p.id + "_id"];
                        h = a.extend(h, d[c.p.id].editData, v);
                        if (c.p.treeGrid === true) {
                            if (h[D] == p.addoper) {
                                L = a(c).jqGrid("getGridParam", "selrow");
                                h[c.p.treeGridModel == "adjacency" ? c.p.treeReader.parent_id_field: "parent_id"] = L
                            }
                            for (r in c.p.treeReader) if (c.p.treeReader.hasOwnProperty(r)) {
                                v = c.p.treeReader[r];
                                if (h.hasOwnProperty(v)) h[D] == p.addoper && r === "parent_id_field" || delete h[v]
                            }
                        }
                        h[E] = a.jgrid.stripPref(c.p.idPrefix, h[E]);
                        r = a.extend({
                            url: d[c.p.id].url ? d[c.p.id].url: a(c).jqGrid("getGridParam", "editurl"),
                            type: d[c.p.id].mtype,
                            data: a.isFunction(d[c.p.id].serializeEditData) ? d[c.p.id].serializeEditData(h) : h,
                            complete: function(F, T) {
                                h[E] = c.p.idPrefix + h[E];
                                if (T != "success") {
                                    k[0] = false;
                                    k[1] = a.isFunction(d[c.p.id].errorTextFormat) ? d[c.p.id].errorTextFormat(F) : T + " Status: '" + F.statusText + "'. Error code: " + F.status
                                } else if (a.isFunction(d[c.p.id].afterSubmit)) k = d[c.p.id].afterSubmit(F, h);
                                if (k[0] === false) {
                                    a("#FormError>td", "#" + i).html(k[1]);
                                    a("#FormError", "#" + i).show()
                                } else {
                                    a.each(c.p.colModel,
                                    function() {
                                        if (O[this.name] && this.formatter && this.formatter == "select") try {
                                            delete O[this.name]
                                        } catch(P) {}
                                    });
                                    h = a.extend(h, O);
                                    c.p.autoencode && a.each(h,
                                    function(P, S) {
                                        h[P] = a.jgrid.htmlDecode(S)
                                    });
                                    if (h[D] == p.addoper) {
                                        k[2] || (k[2] = a.jgrid.randId());
                                        h[E] = k[2];
                                        if (d[c.p.id].closeAfterAdd) {
                                            if (d[c.p.id].reloadAfterSubmit) a(c).trigger("reloadGrid");
                                            else if (c.p.treeGrid === true) a(c).jqGrid("addChildNode", k[2], L, h);
                                            else {
                                                a(c).jqGrid("addRowData", k[2], h, b.addedrow);
                                                a(c).jqGrid("setSelection", k[2])
                                            }
                                            a.jgrid.hideModal("#" + m.themodal, {
                                                gb: "#gbox_" + t,
                                                jqm: b.jqModal,
                                                onClose: d[c.p.id].onClose
                                            })
                                        } else if (d[c.p.id].clearAfterAdd) {
                                            if (d[c.p.id].reloadAfterSubmit) a(c).trigger("reloadGrid");
                                            else c.p.treeGrid === true ? a(c).jqGrid("addChildNode", k[2], L, h) : a(c).jqGrid("addRowData", k[2], h, b.addedrow);
                                            x("_empty", c, o)
                                        } else if (d[c.p.id].reloadAfterSubmit) a(c).trigger("reloadGrid");
                                        else c.p.treeGrid === true ? a(c).jqGrid("addChildNode", k[2], L, h) : a(c).jqGrid("addRowData", k[2], h, b.addedrow)
                                    } else {
                                        if (d[c.p.id].reloadAfterSubmit) {
                                            a(c).trigger("reloadGrid");
                                            d[c.p.id].closeAfterEdit || setTimeout(function() {
                                                a(c).jqGrid("setSelection", h[E])
                                            },
                                            1E3)
                                        } else c.p.treeGrid === true ? a(c).jqGrid("setTreeRow", h[E], h) : a(c).jqGrid("setRowData", h[E], h);
                                        d[c.p.id].closeAfterEdit && a.jgrid.hideModal("#" + m.themodal, {
                                            gb: "#gbox_" + t,
                                            jqm: b.jqModal,
                                            onClose: d[c.p.id].onClose
                                        })
                                    }
                                    if (a.isFunction(d[c.p.id].afterComplete)) {
                                        g = F;
                                        setTimeout(function() {
                                            d[c.p.id].afterComplete(g, h, a("#" + o));
                                            g = null
                                        },
                                        500)
                                    }
                                    if (d[c.p.id].checkOnSubmit || d[c.p.id].checkOnUpdate) {
                                        a("#" + o).data("disabled", false);
                                        if (d[c.p.id]._savedData[c.p.id + "_id"] != "_empty") for (var I in d[c.p.id]._savedData) if (h[I]) d[c.p.id]._savedData[I] = h[I]
                                    }
                                }
                                d[c.p.id].processing = false;
                                a("#sData", "#" + i + "_2").removeClass("ui-state-active");
                                try {
                                    a(":input:visible", "#" + o)[0].focus()
                                } catch(ca) {}
                            }
                        },
                        a.jgrid.ajaxOptions, d[c.p.id].ajaxEditOptions);
                        if (!r.url && !d[c.p.id].useDataProxy) if (a.isFunction(c.p.dataProxy)) d[c.p.id].useDataProxy = true;
                        else {
                            k[0] = false;
                            k[1] += " " + a.jgrid.errors.nourl
                        }
                        if (k[0]) if (d[c.p.id].useDataProxy) {
                            v = c.p.dataProxy.call(c, r, "set_" + c.p.id);
                            if (typeof v == "undefined") v = [true, ""];
                            if (v[0] === false) {
                                k[0] = false;
                                k[1] = v[1] || "Error deleting the selected row!"
                            } else {
                                r.data.oper == p.addoper && d[c.p.id].closeAfterAdd && a.jgrid.hideModal("#" + m.themodal, {
                                    gb: "#gbox_" + t,
                                    jqm: b.jqModal,
                                    onClose: d[c.p.id].onClose
                                });
                                r.data.oper == p.editoper && d[c.p.id].closeAfterEdit && a.jgrid.hideModal("#" + m.themodal, {
                                    gb: "#gbox_" + t,
                                    jqm: b.jqModal,
                                    onClose: d[c.p.id].onClose
                                })
                            }
                        } else a.ajax(r)
                    }
                    if (k[0] === false) {
                        a("#FormError>td", "#" + i).html(k[1]);
                        a("#FormError", "#" + i).show()
                    }
                }
                function w(g, k) {
                    var v = false,
                    p;
                    for (p in g) if (g[p] != k[p]) {
                        v = true;
                        break
                    }
                    return v
                }
                function n() {
                    var g = true;
                    a("#FormError", "#" + i).hide();
                    if (d[c.p.id].checkOnUpdate) {
                        h = {};
                        O = {};
                        e();
                        N = a.extend({},
                        h, O);
                        if (U = w(N, d[c.p.id]._savedData)) {
                            a("#" + o).data("disabled", true);
                            a(".confirm", "#" + m.themodal).show();
                            g = false
                        }
                    }
                    return g
                }
                function j() {
                    if (f !== "_empty" && typeof c.p.savedRow !== "undefined" && c.p.savedRow.length > 0 && a.isFunction(a.fn.jqGrid.restoreRow)) for (var g = 0; g < c.p.savedRow.length; g++) if (c.p.savedRow[g].id == f) {
                        a(c).jqGrid("restoreRow", f);
                        break
                    }
                }
                function s(g, k) {
                    g === 0 ? a("#pData", "#" + i + "_2").addClass("ui-state-disabled") : a("#pData", "#" + i + "_2").removeClass("ui-state-disabled");
                    g == k ? a("#nData", "#" + i + "_2").addClass("ui-state-disabled") : a("#nData", "#" + i + "_2").removeClass("ui-state-disabled")
                }
                function M() {
                    var g = a(c).jqGrid("getDataIDs"),
                    k = a("#id_g", "#" + i).val();
                    return [a.inArray(k, g), g]
                }
                var c = this;
                if (c.grid && f) {
                    var t = c.p.id,
                    o = "FrmGrid_" + t,
                    i = "TblGrid_" + t,
                    m = {
                        themodal: "editmod" + t,
                        modalhead: "edithd" + t,
                        modalcontent: "editcnt" + t,
                        scrollelm: o
                    },
                    H = a.isFunction(d[c.p.id].beforeShowForm) ? d[c.p.id].beforeShowForm: false,
                    J = a.isFunction(d[c.p.id].afterShowForm) ? d[c.p.id].afterShowForm: false,
                    u = a.isFunction(d[c.p.id].beforeInitData) ? d[c.p.id].beforeInitData: false,
                    C = a.isFunction(d[c.p.id].onInitializeForm) ? d[c.p.id].onInitializeForm: false,
                    A = true,
                    l = 1,
                    y = 0,
                    h,
                    O,
                    N,
                    U;
                    if (f === "new") {
                        f = "_empty";
                        b.caption = d[c.p.id].addCaption
                    } else b.caption = d[c.p.id].editCaption;
                    b.recreateForm === true && a("#" + m.themodal).html() !== null && a("#" + m.themodal).remove();
                    var Q = true;
                    if (b.checkOnUpdate && b.jqModal && !b.modal) Q = false;
                    if (a("#" + m.themodal).html() !== null) {
                        if (u) {
                            A = u(a("#" + o));
                            if (typeof A == "undefined") A = true
                        }
                        if (A === false) return;
                        j();
                        a(".ui-jqdialog-title", "#" + m.modalhead).html(b.caption);
                        a("#FormError", "#" + i).hide();
                        if (d[c.p.id].topinfo) {
                            a(".topinfo", "#" + i).html(d[c.p.id].topinfo);
                            a(".tinfo", "#" + i).show()
                        } else a(".tinfo", "#" + i).hide();
                        if (d[c.p.id].bottominfo) {
                            a(".bottominfo", "#" + i + "_2").html(d[c.p.id].bottominfo);
                            a(".binfo", "#" + i + "_2").show()
                        } else a(".binfo", "#" + i + "_2").hide();
                        x(f, c, o);
                        f == "_empty" || !d[c.p.id].viewPagerButtons ? a("#pData, #nData", "#" + i + "_2").hide() : a("#pData, #nData", "#" + i + "_2").show();
                        if (d[c.p.id].processing === true) {
                            d[c.p.id].processing = false;
                            a("#sData", "#" + i + "_2").removeClass("ui-state-active")
                        }
                        if (a("#" + o).data("disabled") === true) {
                            a(".confirm", "#" + m.themodal).hide();
                            a("#" + o).data("disabled", false)
                        }
                        H && H(a("#" + o));
                        a("#" + m.themodal).data("onClose", d[c.p.id].onClose);
                        a.jgrid.viewModal("#" + m.themodal, {
                            gbox: "#gbox_" + t,
                            jqm: b.jqModal,
                            jqM: false,
                            overlay: b.overlay,
                            modal: b.modal
                        });
                        Q || a(".jqmOverlay").click(function() {
                            if (!n()) return false;
                            a.jgrid.hideModal("#" + m.themodal, {
                                gb: "#gbox_" + t,
                                jqm: b.jqModal,
                                onClose: d[c.p.id].onClose
                            });
                            return false
                        });
                        J && J(a("#" + o))
                    } else {
                        var K = isNaN(b.dataheight) ? b.dataheight: b.dataheight + "px";
                        K = a("<form name='FormPost' id='" + o + "' class='FormGrid' onSubmit='return false;' style='width:100%;overflow:auto;position:relative;height:" + K + ";'></form>").data("disabled", false);
                        var V = a("<table id='" + i + "' class='EditTable' cellspacing='0' cellpadding='0' border='0'><tbody></tbody></table>");
                        if (u) {
                            A = u(a("#" + o));
                            if (typeof A == "undefined") A = true
                        }
                        if (A === false) return;
                        j();
                        a(c.p.colModel).each(function() {
                            var g = this.formoptions;
                            l = Math.max(l, g ? g.colpos || 0 : 0);
                            y = Math.max(y, g ? g.rowpos || 0 : 0)
                        });
                        a(K).append(V);
                        u = a("<tr id='FormError' style='display:none'><td class='ui-state-error' colspan='" + l * 2 + "'></td></tr>");
                        u[0].rp = 0;
                        a(V).append(u);
                        u = a("<tr style='display:none' class='tinfo'><td class='topinfo' colspan='" + l * 2 + "'>" + d[c.p.id].topinfo + "</td></tr>");
                        u[0].rp = 0;
                        a(V).append(u);
                        A = (u = c.p.direction == "rtl" ? true: false) ? "nData": "pData";
                        var W = u ? "pData": "nData";
                        q(f, c, V, l);
                        A = "<a href='javascript:void(0)' id='" + A + "' class='fm-button ui-state-default ui-corner-left'><span class='ui-icon ui-icon-triangle-1-w'></span></a>";
                        W = "<a href='javascript:void(0)' id='" + W + "' class='fm-button ui-state-default ui-corner-right'><span class='ui-icon ui-icon-triangle-1-e'></span></a>";
                        var $ = "<a href='javascript:void(0)' id='sData' class='fm-button ui-state-default ui-corner-all'>" + b.bSubmit + "</a>",
                        Z = "<a href='javascript:void(0)' id='cData' class='fm-button ui-state-default ui-corner-all'>" + b.bCancel + "</a>";
                        A = "<table border='0' cellspacing='0' cellpadding='0' class='EditTable' id='" + i + "_2'><tbody><tr><td colspan='2'><hr class='ui-widget-content' style='margin:1px'/></td></tr><tr id='Act_Buttons'><td class='navButton'>" + (u ? W + A: A + W) + "</td><td class='EditButton'>" + $ + Z + "</td></tr>";
                        A += "<tr style='display:none' class='binfo'><td class='bottominfo' colspan='2'>" + d[c.p.id].bottominfo + "</td></tr>";
                        A += "</tbody></table>";
                        if (y > 0) {
                            var aa = [];
                            a.each(a(V)[0].rows,
                            function(g, k) {
                                aa[g] = k
                            });
                            aa.sort(function(g, k) {
                                if (g.rp > k.rp) return 1;
                                if (g.rp < k.rp) return - 1;
                                return 0
                            });
                            a.each(aa,
                            function(g, k) {
                                a("tbody", V).append(k)
                            })
                        }
                        b.gbox = "#gbox_" + t;
                        var ba = false;
                        if (b.closeOnEscape === true) {
                            b.closeOnEscape = false;
                            ba = true
                        }
                        K = a("<span></span>").append(K).append(A);
                        a.jgrid.createModal(m, K, b, "#gview_" + c.p.id, a("#gbox_" + c.p.id)[0]);
                        if (u) {
                            a("#pData, #nData", "#" + i + "_2").css("float", "right");
                            a(".EditButton", "#" + i + "_2").css("text-align", "left")
                        }
                        d[c.p.id].topinfo && a(".tinfo", "#" + i).show();
                        d[c.p.id].bottominfo && a(".binfo", "#" + i + "_2").show();
                        A = K = null;
                        a("#" + m.themodal).keydown(function(g) {
                            var k = g.target;
                            if (a("#" + o).data("disabled") === true) return false;
                            if (d[c.p.id].savekey[0] === true && g.which == d[c.p.id].savekey[1]) if (k.tagName != "TEXTAREA") {
                                a("#sData", "#" + i + "_2").trigger("click");
                                return false
                            }
                            if (g.which === 27) {
                                if (!n()) return false;
                                ba && a.jgrid.hideModal(this, {
                                    gb: b.gbox,
                                    jqm: b.jqModal,
                                    onClose: d[c.p.id].onClose
                                });
                                return false
                            }
                            if (d[c.p.id].navkeys[0] === true) {
                                if (a("#id_g", "#" + i).val() == "_empty") return true;
                                if (g.which == d[c.p.id].navkeys[1]) {
                                    a("#pData", "#" + i + "_2").trigger("click");
                                    return false
                                }
                                if (g.which == d[c.p.id].navkeys[2]) {
                                    a("#nData", "#" + i + "_2").trigger("click");
                                    return false
                                }
                            }
                        });
                        if (b.checkOnUpdate) {
                            a("a.ui-jqdialog-titlebar-close span", "#" + m.themodal).removeClass("jqmClose");
                            a("a.ui-jqdialog-titlebar-close", "#" + m.themodal).unbind("click").click(function() {
                                if (!n()) return false;
                                a.jgrid.hideModal("#" + m.themodal, {
                                    gb: "#gbox_" + t,
                                    jqm: b.jqModal,
                                    onClose: d[c.p.id].onClose
                                });
                                return false
                            })
                        }
                        b.saveicon = a.extend([true, "left", "ui-icon-disk"], b.saveicon);
                        b.closeicon = a.extend([true, "left", "ui-icon-close"], b.closeicon);
                        if (b.saveicon[0] === true) a("#sData", "#" + i + "_2").addClass(b.saveicon[1] == "right" ? "fm-button-icon-right": "fm-button-icon-left").append("<span class='ui-icon " + b.saveicon[2] + "'></span>");
                        if (b.closeicon[0] === true) a("#cData", "#" + i + "_2").addClass(b.closeicon[1] == "right" ? "fm-button-icon-right": "fm-button-icon-left").append("<span class='ui-icon " + b.closeicon[2] + "'></span>");
                        if (d[c.p.id].checkOnSubmit || d[c.p.id].checkOnUpdate) {
                            $ = "<a href='javascript:void(0)' id='sNew' class='fm-button ui-state-default ui-corner-all' style='z-index:1002'>" + b.bYes + "</a>";
                            W = "<a href='javascript:void(0)' id='nNew' class='fm-button ui-state-default ui-corner-all' style='z-index:1002'>" + b.bNo + "</a>";
                            Z = "<a href='javascript:void(0)' id='cNew' class='fm-button ui-state-default ui-corner-all' style='z-index:1002'>" + b.bExit + "</a>";
                            K = b.zIndex || 999;
                            K++;
                            a("<div class='ui-widget-overlay jqgrid-overlay confirm' style='z-index:" + K + ";display:none;'>&#160;" + (a.browser.msie && a.browser.version == 6 ? '<iframe style="display:block;position:absolute;z-index:-1;filter:Alpha(Opacity=\'0\');" src="javascript:false;"></iframe>': "") + "</div><div class='confirm ui-widget-content ui-jqconfirm' style='z-index:" + (K + 1) + "'>" + b.saveData + "<br/><br/>" + $ + W + Z + "</div>").insertAfter("#" + o);
                            a("#sNew", "#" + m.themodal).click(function() {
                                B();
                                a("#" + o).data("disabled", false);
                                a(".confirm", "#" + m.themodal).hide();
                                return false
                            });
                            a("#nNew", "#" + m.themodal).click(function() {
                                a(".confirm", "#" + m.themodal).hide();
                                a("#" + o).data("disabled", false);
                                setTimeout(function() {
                                    a(":input", "#" + o)[0].focus()
                                },
                                0);
                                return false
                            });
                            a("#cNew", "#" + m.themodal).click(function() {
                                a(".confirm", "#" + m.themodal).hide();
                                a("#" + o).data("disabled", false);
                                a.jgrid.hideModal("#" + m.themodal, {
                                    gb: "#gbox_" + t,
                                    jqm: b.jqModal,
                                    onClose: d[c.p.id].onClose
                                });
                                return false
                            })
                        }
                        C && C(a("#" + o));
                        f == "_empty" || !d[c.p.id].viewPagerButtons ? a("#pData,#nData", "#" + i + "_2").hide() : a("#pData,#nData", "#" + i + "_2").show();
                        H && H(a("#" + o));
                        a("#" + m.themodal).data("onClose", d[c.p.id].onClose);
                        a.jgrid.viewModal("#" + m.themodal, {
                            gbox: "#gbox_" + t,
                            jqm: b.jqModal,
                            overlay: b.overlay,
                            modal: b.modal
                        });
                        Q || a(".jqmOverlay").click(function() {
                            if (!n()) return false;
                            a.jgrid.hideModal("#" + m.themodal, {
                                gb: "#gbox_" + t,
                                jqm: b.jqModal,
                                onClose: d[c.p.id].onClose
                            });
                            return false
                        });
                        J && J(a("#" + o));
                        a(".fm-button", "#" + m.themodal).hover(function() {
                            a(this).addClass("ui-state-hover")
                        },
                        function() {
                            a(this).removeClass("ui-state-hover")
                        });
                        a("#sData", "#" + i + "_2").click(function() {
                            h = {};
                            O = {};
                            a("#FormError", "#" + i).hide();
                            e();
                            if (h[c.p.id + "_id"] == "_empty") B();
                            else if (b.checkOnSubmit === true) {
                                N = a.extend({},
                                h, O);
                                if (U = w(N, d[c.p.id]._savedData)) {
                                    a("#" + o).data("disabled", true);
                                    a(".confirm", "#" + m.themodal).show()
                                } else B()
                            } else B();
                            return false
                        });
                        a("#cData", "#" + i + "_2").click(function() {
                            if (!n()) return false;
                            a.jgrid.hideModal("#" + m.themodal, {
                                gb: "#gbox_" + t,
                                jqm: b.jqModal,
                                onClose: d[c.p.id].onClose
                            });
                            return false
                        });
                        a("#nData", "#" + i + "_2").click(function() {
                            if (!n()) return false;
                            a("#FormError", "#" + i).hide();
                            var g = M();
                            g[0] = parseInt(g[0], 10);
                            if (g[0] != -1 && g[1][g[0] + 1]) {
                                if (a.isFunction(b.onclickPgButtons)) b.onclickPgButtons("next", a("#" + o), g[1][g[0]]);
                                x(g[1][g[0] + 1], c, o);
                                a(c).jqGrid("setSelection", g[1][g[0] + 1]);
                                a.isFunction(b.afterclickPgButtons) && b.afterclickPgButtons("next", a("#" + o), g[1][g[0] + 1]);
                                s(g[0] + 1, g[1].length - 1)
                            }
                            return false
                        });
                        a("#pData", "#" + i + "_2").click(function() {
                            if (!n()) return false;
                            a("#FormError", "#" + i).hide();
                            var g = M();
                            if (g[0] != -1 && g[1][g[0] - 1]) {
                                if (a.isFunction(b.onclickPgButtons)) b.onclickPgButtons("prev", a("#" + o), g[1][g[0]]);
                                x(g[1][g[0] - 1], c, o);
                                a(c).jqGrid("setSelection", g[1][g[0] - 1]);
                                a.isFunction(b.afterclickPgButtons) && b.afterclickPgButtons("prev", a("#" + o), g[1][g[0] - 1]);
                                s(g[0] - 1, g[1].length - 1)
                            }
                            return false
                        })
                    }
                    H = M();
                    s(H[0], H[1].length - 1)
                }
            })
        },
        viewGridRow: function(f, b) {
            b = a.extend({
                top: 0,
                left: 0,
                width: 0,
                height: "auto",
                dataheight: "auto",
                modal: false,
                overlay: 30,
                drag: true,
                resize: true,
                jqModal: true,
                closeOnEscape: false,
                labelswidth: "30%",
                closeicon: [],
                navkeys: [false, 38, 40],
                onClose: null,
                beforeShowForm: null,
                beforeInitData: null,
                viewPagerButtons: true
            },
            a.jgrid.view, b || {});
            return this.each(function() {
                function e() {
                    if (b.closeOnEscape === true || b.navkeys[0] === true) setTimeout(function() {
                        a(".ui-jqdialog-titlebar-close", "#" + M.modalhead).focus()
                    },
                    0)
                }
                function q(l, y, h, O) {
                    for (var N, U, Q, K = 0,
                    V, W, $ = [], Z = false, aa = "<td class='CaptionTD form-view-label ui-widget-content' width='" + b.labelswidth + "'>&#160;</td><td class='DataTD form-view-data ui-helper-reset ui-widget-content'>&#160;</td>", ba = "", g = ["integer", "number", "currency"], k = 0, v = 0, p, E, D, z = 1; z <= O; z++) ba += z == 1 ? aa: "<td class='CaptionTD form-view-label ui-widget-content'>&#160;</td><td class='DataTD form-view-data ui-widget-content'>&#160;</td>";
                    a(y.p.colModel).each(function() {
                        U = this.editrules && this.editrules.edithidden === true ? false: this.hidden === true ? true: false;
                        if (!U && this.align === "right") if (this.formatter && a.inArray(this.formatter, g) !== -1) k = Math.max(k, parseInt(this.width, 10));
                        else v = Math.max(v, parseInt(this.width, 10))
                    });
                    p = k !== 0 ? k: v !== 0 ? v: 0;
                    Z = a(y).jqGrid("getInd", l);
                    a(y.p.colModel).each(function(L) {
                        N = this.name;
                        E = false;
                        W = (U = this.editrules && this.editrules.edithidden === true ? false: this.hidden === true ? true: false) ? "style='display:none'": "";
                        D = typeof this.viewable != "boolean" ? true: this.viewable;
                        if (N !== "cb" && N !== "subgrid" && N !== "rn" && D) {
                            V = Z === false ? "": N == y.p.ExpandColumn && y.p.treeGrid === true ? a("td:eq(" + L + ")", y.rows[Z]).text() : a("td:eq(" + L + ")", y.rows[Z]).html();
                            E = this.align === "right" && p !== 0 ? true: false;
                            a.extend({},
                            this.editoptions || {},
                            {
                                id: N,
                                name: N
                            });
                            var r = a.extend({},
                            {
                                rowabove: false,
                                rowcontent: ""
                            },
                            this.formoptions || {}),
                            R = parseInt(r.rowpos, 10) || K + 1,
                            F = parseInt((parseInt(r.colpos, 10) || 1) * 2, 10);
                            if (r.rowabove) {
                                var T = a("<tr><td class='contentinfo' colspan='" + O * 2 + "'>" + r.rowcontent + "</td></tr>");
                                a(h).append(T);
                                T[0].rp = R
                            }
                            Q = a(h).find("tr[rowpos=" + R + "]");
                            if (Q.length === 0) {
                                Q = a("<tr " + W + " rowpos='" + R + "'></tr>").addClass("FormData").attr("id", "trv_" + N);
                                a(Q).append(ba);
                                a(h).append(Q);
                                Q[0].rp = R
                            }
                            a("td:eq(" + (F - 2) + ")", Q[0]).html("<b>" + (typeof r.label === "undefined" ? y.p.colNames[L] : r.label) + "</b>");
                            a("td:eq(" + (F - 1) + ")", Q[0]).append("<span>" + V + "</span>").attr("id", "v_" + N);
                            E && a("td:eq(" + (F - 1) + ") span", Q[0]).css({
                                "text-align": "right",
                                width: p + "px"
                            });
                            $[K] = L;
                            K++
                        }
                    });
                    if (K > 0) {
                        l = a("<tr class='FormData' style='display:none'><td class='CaptionTD'></td><td colspan='" + (O * 2 - 1) + "' class='DataTD'><input class='FormElement' id='id_g' type='text' name='id' value='" + l + "'/></td></tr>");
                        l[0].rp = K + 99;
                        a(h).append(l)
                    }
                    return $
                }
                function x(l, y) {
                    var h, O, N = 0,
                    U, Q;
                    if (Q = a(y).jqGrid("getInd", l, true)) {
                        a("td", Q).each(function(K) {
                            h = y.p.colModel[K].name;
                            O = y.p.colModel[K].editrules && y.p.colModel[K].editrules.edithidden === true ? false: y.p.colModel[K].hidden === true ? true: false;
                            if (h !== "cb" && h !== "subgrid" && h !== "rn") {
                                U = h == y.p.ExpandColumn && y.p.treeGrid === true ? a(this).text() : a(this).html();
                                a.extend({},
                                y.p.colModel[K].editoptions || {});
                                h = a.jgrid.jqID("v_" + h);
                                a("#" + h + " span", "#" + s).html(U);
                                O && a("#" + h, "#" + s).parents("tr:first").hide();
                                N++
                            }
                        });
                        N > 0 && a("#id_g", "#" + s).val(l)
                    }
                }
                function G(l, y) {
                    l === 0 ? a("#pData", "#" + s + "_2").addClass("ui-state-disabled") : a("#pData", "#" + s + "_2").removeClass("ui-state-disabled");
                    l == y ? a("#nData", "#" + s + "_2").addClass("ui-state-disabled") : a("#nData", "#" + s + "_2").removeClass("ui-state-disabled")
                }
                function B() {
                    var l = a(w).jqGrid("getDataIDs"),
                    y = a("#id_g", "#" + s).val();
                    return [a.inArray(y, l), l]
                }
                var w = this;
                if (w.grid && f) {
                    var n = w.p.id,
                    j = "ViewGrid_" + n,
                    s = "ViewTbl_" + n,
                    M = {
                        themodal: "viewmod" + n,
                        modalhead: "viewhd" + n,
                        modalcontent: "viewcnt" + n,
                        scrollelm: j
                    },
                    c = a.isFunction(b.beforeInitData) ? b.beforeInitData: false,
                    t = true,
                    o = 1,
                    i = 0;
                    if (a("#" + M.themodal).html() !== null) {
                        if (c) {
                            t = c(a("#" + j));
                            if (typeof t == "undefined") t = true
                        }
                        if (t === false) return;
                        a(".ui-jqdialog-title", "#" + M.modalhead).html(b.caption);
                        a("#FormError", "#" + s).hide();
                        x(f, w);
                        a.isFunction(b.beforeShowForm) && b.beforeShowForm(a("#" + j));
                        a.jgrid.viewModal("#" + M.themodal, {
                            gbox: "#gbox_" + n,
                            jqm: b.jqModal,
                            jqM: false,
                            overlay: b.overlay,
                            modal: b.modal
                        });
                        e()
                    } else {
                        var m = isNaN(b.dataheight) ? b.dataheight: b.dataheight + "px";
                        m = a("<form name='FormPost' id='" + j + "' class='FormGrid' style='width:100%;overflow:auto;position:relative;height:" + m + ";'></form>");
                        var H = a("<table id='" + s + "' class='EditTable' cellspacing='1' cellpadding='2' border='0' style='table-layout:fixed'><tbody></tbody></table>");
                        if (c) {
                            t = c(a("#" + j));
                            if (typeof t == "undefined") t = true
                        }
                        if (t === false) return;
                        a(w.p.colModel).each(function() {
                            var l = this.formoptions;
                            o = Math.max(o, l ? l.colpos || 0 : 0);
                            i = Math.max(i, l ? l.rowpos || 0 : 0)
                        });
                        a(m).append(H);
                        q(f, w, H, o);
                        c = w.p.direction == "rtl" ? true: false;
                        t = "<a href='javascript:void(0)' id='" + (c ? "nData": "pData") + "' class='fm-button ui-state-default ui-corner-left'><span class='ui-icon ui-icon-triangle-1-w'></span></a>";
                        var J = "<a href='javascript:void(0)' id='" + (c ? "pData": "nData") + "' class='fm-button ui-state-default ui-corner-right'><span class='ui-icon ui-icon-triangle-1-e'></span></a>",
                        u = "<a href='javascript:void(0)' id='cData' class='fm-button ui-state-default ui-corner-all'>" + b.bClose + "</a>";
                        if (i > 0) {
                            var C = [];
                            a.each(a(H)[0].rows,
                            function(l, y) {
                                C[l] = y
                            });
                            C.sort(function(l, y) {
                                if (l.rp > y.rp) return 1;
                                if (l.rp < y.rp) return - 1;
                                return 0
                            });
                            a.each(C,
                            function(l, y) {
                                a("tbody", H).append(y)
                            })
                        }
                        b.gbox = "#gbox_" + n;
                        var A = false;
                        if (b.closeOnEscape === true) {
                            b.closeOnEscape = false;
                            A = true
                        }
                        m = a("<span></span>").append(m).append("<table border='0' class='EditTable' id='" + s + "_2'><tbody><tr id='Act_Buttons'><td class='navButton' width='" + b.labelswidth + "'>" + (c ? J + t: t + J) + "</td><td class='EditButton'>" + u + "</td></tr></tbody></table>");
                        a.jgrid.createModal(M, m, b, "#gview_" + w.p.id, a("#gview_" + w.p.id)[0]);
                        if (c) {
                            a("#pData, #nData", "#" + s + "_2").css("float", "right");
                            a(".EditButton", "#" + s + "_2").css("text-align", "left")
                        }
                        b.viewPagerButtons || a("#pData, #nData", "#" + s + "_2").hide();
                        m = null;
                        a("#" + M.themodal).keydown(function(l) {
                            if (l.which === 27) {
                                A && a.jgrid.hideModal(this, {
                                    gb: b.gbox,
                                    jqm: b.jqModal,
                                    onClose: b.onClose
                                });
                                return false
                            }
                            if (b.navkeys[0] === true) {
                                if (l.which === b.navkeys[1]) {
                                    a("#pData", "#" + s + "_2").trigger("click");
                                    return false
                                }
                                if (l.which === b.navkeys[2]) {
                                    a("#nData", "#" + s + "_2").trigger("click");
                                    return false
                                }
                            }
                        });
                        b.closeicon = a.extend([true, "left", "ui-icon-close"], b.closeicon);
                        if (b.closeicon[0] === true) a("#cData", "#" + s + "_2").addClass(b.closeicon[1] == "right" ? "fm-button-icon-right": "fm-button-icon-left").append("<span class='ui-icon " + b.closeicon[2] + "'></span>");
                        a.isFunction(b.beforeShowForm) && b.beforeShowForm(a("#" + j));
                        a.jgrid.viewModal("#" + M.themodal, {
                            gbox: "#gbox_" + n,
                            jqm: b.jqModal,
                            modal: b.modal
                        });
                        a(".fm-button:not(.ui-state-disabled)", "#" + s + "_2").hover(function() {
                            a(this).addClass("ui-state-hover")
                        },
                        function() {
                            a(this).removeClass("ui-state-hover")
                        });
                        e();
                        a("#cData", "#" + s + "_2").click(function() {
                            a.jgrid.hideModal("#" + M.themodal, {
                                gb: "#gbox_" + n,
                                jqm: b.jqModal,
                                onClose: b.onClose
                            });
                            return false
                        });
                        a("#nData", "#" + s + "_2").click(function() {
                            a("#FormError", "#" + s).hide();
                            var l = B();
                            l[0] = parseInt(l[0], 10);
                            if (l[0] != -1 && l[1][l[0] + 1]) {
                                if (a.isFunction(b.onclickPgButtons)) b.onclickPgButtons("next", a("#" + j), l[1][l[0]]);
                                x(l[1][l[0] + 1], w);
                                a(w).jqGrid("setSelection", l[1][l[0] + 1]);
                                a.isFunction(b.afterclickPgButtons) && b.afterclickPgButtons("next", a("#" + j), l[1][l[0] + 1]);
                                G(l[0] + 1, l[1].length - 1)
                            }
                            e();
                            return false
                        });
                        a("#pData", "#" + s + "_2").click(function() {
                            a("#FormError", "#" + s).hide();
                            var l = B();
                            if (l[0] != -1 && l[1][l[0] - 1]) {
                                if (a.isFunction(b.onclickPgButtons)) b.onclickPgButtons("prev", a("#" + j), l[1][l[0]]);
                                x(l[1][l[0] - 1], w);
                                a(w).jqGrid("setSelection", l[1][l[0] - 1]);
                                a.isFunction(b.afterclickPgButtons) && b.afterclickPgButtons("prev", a("#" + j), l[1][l[0] - 1]);
                                G(l[0] - 1, l[1].length - 1)
                            }
                            e();
                            return false
                        })
                    }
                    m = B();
                    G(m[0], m[1].length - 1)
                }
            })
        },
        delGridRow: function(f, b) {
            b = a.extend({
                top: 0,
                left: 0,
                width: 240,
                height: "auto",
                dataheight: "auto",
                modal: false,
                overlay: 30,
                drag: true,
                resize: true,
                url: "",
                mtype: "POST",
                reloadAfterSubmit: true,
                beforeShowForm: null,
                beforeInitData: null,
                afterShowForm: null,
                beforeSubmit: null,
                onclickSubmit: null,
                afterSubmit: null,
                jqModal: true,
                closeOnEscape: false,
                delData: {},
                delicon: [],
                cancelicon: [],
                onClose: null,
                ajaxDelOptions: {},
                processing: false,
                serializeDelData: null,
                useDataProxy: false
            },
            a.jgrid.del, b || {});
            d[a(this)[0].p.id] = b;
            return this.each(function() {
                var e = this;
                if (e.grid) if (f) {
                    var q = a.isFunction(d[e.p.id].beforeShowForm),
                    x = a.isFunction(d[e.p.id].afterShowForm),
                    G = a.isFunction(d[e.p.id].beforeInitData) ? d[e.p.id].beforeInitData: false,
                    B = e.p.id,
                    w = {},
                    n = true,
                    j = "DelTbl_" + B,
                    s,
                    M,
                    c,
                    t,
                    o = {
                        themodal: "delmod" + B,
                        modalhead: "delhd" + B,
                        modalcontent: "delcnt" + B,
                        scrollelm: j
                    };
                    if (jQuery.isArray(f)) f = f.join();
                    if (a("#" + o.themodal).html() !== null) {
                        if (G) {
                            n = G(a("#" + j));
                            if (typeof n == "undefined") n = true
                        }
                        if (n === false) return;
                        a("#DelData>td", "#" + j).text(f);
                        a("#DelError", "#" + j).hide();
                        if (d[e.p.id].processing === true) {
                            d[e.p.id].processing = false;
                            a("#dData", "#" + j).removeClass("ui-state-active")
                        }
                        q && d[e.p.id].beforeShowForm(a("#" + j));
                        a.jgrid.viewModal("#" + o.themodal, {
                            gbox: "#gbox_" + B,
                            jqm: d[e.p.id].jqModal,
                            jqM: false,
                            overlay: d[e.p.id].overlay,
                            modal: d[e.p.id].modal
                        })
                    } else {
                        var i = isNaN(d[e.p.id].dataheight) ? d[e.p.id].dataheight: d[e.p.id].dataheight + "px";
                        i = "<div id='" + j + "' class='formdata' style='width:100%;overflow:auto;position:relative;height:" + i + ";'>";
                        i += "<table class='DelTable'><tbody>";
                        i += "<tr id='DelError' style='display:none'><td class='ui-state-error'></td></tr>";
                        i += "<tr id='DelData' style='display:none'><td >" + f + "</td></tr>";
                        i += '<tr><td class="delmsg" style="white-space:pre;">' + d[e.p.id].msg + "</td></tr><tr><td >&#160;</td></tr>";
                        i += "</tbody></table></div>";
                        i += "<table cellspacing='0' cellpadding='0' border='0' class='EditTable' id='" + j + "_2'><tbody><tr><td><hr class='ui-widget-content' style='margin:1px'/></td></tr><tr><td class='DelButton EditButton'>" + ("<a href='javascript:void(0)' id='dData' class='fm-button ui-state-default ui-corner-all'>" + b.bSubmit + "</a>") + "&#160;" + ("<a href='javascript:void(0)' id='eData' class='fm-button ui-state-default ui-corner-all'>" + b.bCancel + "</a>") + "</td></tr></tbody></table>";
                        b.gbox = "#gbox_" + B;
                        a.jgrid.createModal(o, i, b, "#gview_" + e.p.id, a("#gview_" + e.p.id)[0]);
                        if (G) {
                            n = G(a("#" + j));
                            if (typeof n == "undefined") n = true
                        }
                        if (n === false) return;
                        a(".fm-button", "#" + j + "_2").hover(function() {
                            a(this).addClass("ui-state-hover")
                        },
                        function() {
                            a(this).removeClass("ui-state-hover")
                        });
                        b.delicon = a.extend([true, "left", "ui-icon-scissors"], d[e.p.id].delicon);
                        b.cancelicon = a.extend([true, "left", "ui-icon-cancel"], d[e.p.id].cancelicon);
                        if (b.delicon[0] === true) a("#dData", "#" + j + "_2").addClass(b.delicon[1] == "right" ? "fm-button-icon-right": "fm-button-icon-left").append("<span class='ui-icon " + b.delicon[2] + "'></span>");
                        if (b.cancelicon[0] === true) a("#eData", "#" + j + "_2").addClass(b.cancelicon[1] == "right" ? "fm-button-icon-right": "fm-button-icon-left").append("<span class='ui-icon " + b.cancelicon[2] + "'></span>");
                        a("#dData", "#" + j + "_2").click(function() {
                            var m = [true, ""];
                            w = {};
                            var H = a("#DelData>td", "#" + j).text();
                            if (a.isFunction(d[e.p.id].onclickSubmit)) w = d[e.p.id].onclickSubmit(d[e.p.id], H) || {};
                            if (a.isFunction(d[e.p.id].beforeSubmit)) m = d[e.p.id].beforeSubmit(H);
                            if (m[0] && !d[e.p.id].processing) {
                                d[e.p.id].processing = true;
                                a(this).addClass("ui-state-active");
                                c = e.p.prmNames;
                                s = a.extend({},
                                d[e.p.id].delData, w);
                                t = c.oper;
                                s[t] = c.deloper;
                                M = c.id;
                                H = H.split(",");
                                for (var J in H) if (H.hasOwnProperty(J)) H[J] = a.jgrid.stripPref(e.p.idPrefix, H[J]);
                                s[M] = H.join();
                                J = a.extend({
                                    url: d[e.p.id].url ? d[e.p.id].url: a(e).jqGrid("getGridParam", "editurl"),
                                    type: d[e.p.id].mtype,
                                    data: a.isFunction(d[e.p.id].serializeDelData) ? d[e.p.id].serializeDelData(s) : s,
                                    complete: function(u, C) {
                                        if (C != "success") {
                                            m[0] = false;
                                            m[1] = a.isFunction(d[e.p.id].errorTextFormat) ? d[e.p.id].errorTextFormat(u) : C + " Status: '" + u.statusText + "'. Error code: " + u.status
                                        } else if (a.isFunction(d[e.p.id].afterSubmit)) m = d[e.p.id].afterSubmit(u, s);
                                        if (m[0] === false) {
                                            a("#DelError>td", "#" + j).html(m[1]);
                                            a("#DelError", "#" + j).show()
                                        } else {
                                            if (d[e.p.id].reloadAfterSubmit && e.p.datatype != "local") a(e).trigger("reloadGrid");
                                            else {
                                                var A = [];
                                                A = H.split(",");
                                                if (e.p.treeGrid === true) try {
                                                    a(e).jqGrid("delTreeNode", e.p.idPrefix + A[0])
                                                } catch(l) {} else for (var y = 0; y < A.length; y++) a(e).jqGrid("delRowData", e.p.idPrefix + A[y]);
                                                e.p.selrow = null;
                                                e.p.selarrrow = []
                                            }
                                            a.isFunction(d[e.p.id].afterComplete) && setTimeout(function() {
                                                d[e.p.id].afterComplete(u, H)
                                            },
                                            500)
                                        }
                                        d[e.p.id].processing = false;
                                        a("#dData", "#" + j + "_2").removeClass("ui-state-active");
                                        m[0] && a.jgrid.hideModal("#" + o.themodal, {
                                            gb: "#gbox_" + B,
                                            jqm: b.jqModal,
                                            onClose: d[e.p.id].onClose
                                        })
                                    }
                                },
                                a.jgrid.ajaxOptions, d[e.p.id].ajaxDelOptions);
                                if (!J.url && !d[e.p.id].useDataProxy) if (a.isFunction(e.p.dataProxy)) d[e.p.id].useDataProxy = true;
                                else {
                                    m[0] = false;
                                    m[1] += " " + a.jgrid.errors.nourl
                                }
                                if (m[0]) if (d[e.p.id].useDataProxy) {
                                    J = e.p.dataProxy.call(e, J, "del_" + e.p.id);
                                    if (typeof J == "undefined") J = [true, ""];
                                    if (J[0] === false) {
                                        m[0] = false;
                                        m[1] = J[1] || "Error deleting the selected row!"
                                    } else a.jgrid.hideModal("#" + o.themodal, {
                                        gb: "#gbox_" + B,
                                        jqm: b.jqModal,
                                        onClose: d[e.p.id].onClose
                                    })
                                } else a.ajax(J)
                            }
                            if (m[0] === false) {
                                a("#DelError>td", "#" + j).html(m[1]);
                                a("#DelError", "#" + j).show()
                            }
                            return false
                        });
                        a("#eData", "#" + j + "_2").click(function() {
                            a.jgrid.hideModal("#" + o.themodal, {
                                gb: "#gbox_" + B,
                                jqm: d[e.p.id].jqModal,
                                onClose: d[e.p.id].onClose
                            });
                            return false
                        });
                        q && d[e.p.id].beforeShowForm(a("#" + j));
                        a.jgrid.viewModal("#" + o.themodal, {
                            gbox: "#gbox_" + B,
                            jqm: d[e.p.id].jqModal,
                            overlay: d[e.p.id].overlay,
                            modal: d[e.p.id].modal
                        })
                    }
                    x && d[e.p.id].afterShowForm(a("#" + j));
                    d[e.p.id].closeOnEscape === true && setTimeout(function() {
                        a(".ui-jqdialog-titlebar-close", "#" + o.modalhead).focus()
                    },
                    0)
                }
            })
        },
        navGrid: function(f, b, e, q, x, G, B) {
            b = a.extend({
                edit: true,
                editicon: "ui-icon-pencil",
                add: true,
                addicon: "ui-icon-plus",
                del: true,
                delicon: "ui-icon-trash",
                search: true,
                searchicon: "ui-icon-search",
                refresh: true,
                refreshicon: "ui-icon-refresh",
                refreshstate: "firstpage",
                view: false,
                viewicon: "ui-icon-document",
                position: "left",
                closeOnEscape: true,
                beforeRefresh: null,
                afterRefresh: null,
                cloneToTop: false,
                alertwidth: 200,
                alertheight: "auto",
                alerttop: null,
                alertleft: null,
                alertzIndex: null
            },
            a.jgrid.nav, b || {});
            return this.each(function() {
                if (!this.nav) {
                    var w = {
                        themodal: "alertmod",
                        modalhead: "alerthd",
                        modalcontent: "alertcnt"
                    },
                    n = this,
                    j;
                    if (! (!n.grid || typeof f != "string")) {
                        if (a("#" + w.themodal).html() === null) {
                            if (!b.alerttop && !b.alertleft) {
                                if (typeof window.innerWidth != "undefined") {
                                    b.alertleft = window.innerWidth;
                                    b.alerttop = window.innerHeight
                                } else if (typeof document.documentElement != "undefined" && typeof document.documentElement.clientWidth != "undefined" && document.documentElement.clientWidth !== 0) {
                                    b.alertleft = document.documentElement.clientWidth;
                                    b.alerttop = document.documentElement.clientHeight
                                } else {
                                    b.alertleft = 1024;
                                    b.alerttop = 768
                                }
                                b.alertleft = b.alertleft / 2 - parseInt(b.alertwidth, 10) / 2;
                                b.alerttop = b.alerttop / 2 - 25
                            }
                            a.jgrid.createModal(w, "<div>" + b.alerttext + "</div><span tabindex='0'><span tabindex='-1' id='jqg_alrt'></span></span>", {
                                gbox: "#gbox_" + n.p.id,
                                jqModal: true,
                                drag: true,
                                resize: true,
                                caption: b.alertcap,
                                top: b.alerttop,
                                left: b.alertleft,
                                width: b.alertwidth,
                                height: b.alertheight,
                                closeOnEscape: b.closeOnEscape,
                                zIndex: b.alertzIndex
                            },
                            "", "", true)
                        }
                        var s = 1;
                        if (b.cloneToTop && n.p.toppager) s = 2;
                        for (var M = 0; M < s; M++) {
                            var c = a("<table cellspacing='0' cellpadding='0' border='0' class='ui-pg-table navtable' style='float:left;table-layout:auto;'><tbody><tr></tr></tbody></table>"),
                            t,
                            o;
                            if (M === 0) {
                                t = f;
                                o = n.p.id;
                                if (t == n.p.toppager) {
                                    o += "_top";
                                    s = 1
                                }
                            } else {
                                t = n.p.toppager;
                                o = n.p.id + "_top"
                            }
                            n.p.direction == "rtl" && a(c).attr("dir", "rtl").css("float", "right");
                            if (b.add) {
                                q = q || {};
                                j = a("<td class='ui-pg-button ui-corner-all'></td>");
                                a(j).append("<div class='ui-pg-div'><span class='ui-icon " + b.addicon + "'></span>" + b.addtext + "</div>");
                                a("tr", c).append(j);
                                a(j, c).attr({
                                    title: b.addtitle || "",
                                    id: q.id || "add_" + o
                                }).click(function() {
                                    a(this).hasClass("ui-state-disabled") || (a.isFunction(b.addfunc) ? b.addfunc() : a(n).jqGrid("editGridRow", "new", q));
                                    return false
                                }).hover(function() {
                                    a(this).hasClass("ui-state-disabled") || a(this).addClass("ui-state-hover")
                                },
                                function() {
                                    a(this).removeClass("ui-state-hover")
                                });
                                j = null
                            }
                            if (b.edit) {
                                j = a("<td class='ui-pg-button ui-corner-all'></td>");
                                e = e || {};
                                a(j).append("<div class='ui-pg-div'><span class='ui-icon " + b.editicon + "'></span>" + b.edittext + "</div>");
                                a("tr", c).append(j);
                                a(j, c).attr({
                                    title: b.edittitle || "",
                                    id: e.id || "edit_" + o
                                }).click(function() {
                                    if (!a(this).hasClass("ui-state-disabled")) {
                                        var i = n.p.selrow;
                                        if (i) a.isFunction(b.editfunc) ? b.editfunc(i) : a(n).jqGrid("editGridRow", i, e);
                                        else {
                                            a.jgrid.viewModal("#" + w.themodal, {
                                                gbox: "#gbox_" + n.p.id,
                                                jqm: true
                                            });
                                            a("#jqg_alrt").focus()
                                        }
                                    }
                                    return false
                                }).hover(function() {
                                    a(this).hasClass("ui-state-disabled") || a(this).addClass("ui-state-hover")
                                },
                                function() {
                                    a(this).removeClass("ui-state-hover")
                                });
                                j = null
                            }
                            if (b.view) {
                                j = a("<td class='ui-pg-button ui-corner-all'></td>");
                                B = B || {};
                                a(j).append("<div class='ui-pg-div'><span class='ui-icon " + b.viewicon + "'></span>" + b.viewtext + "</div>");
                                a("tr", c).append(j);
                                a(j, c).attr({
                                    title: b.viewtitle || "",
                                    id: B.id || "view_" + o
                                }).click(function() {
                                    if (!a(this).hasClass("ui-state-disabled")) {
                                        var i = n.p.selrow;
                                        if (i) a.isFunction(b.viewfunc) ? b.viewfunc(i) : a(n).jqGrid("viewGridRow", i, B);
                                        else {
                                            a.jgrid.viewModal("#" + w.themodal, {
                                                gbox: "#gbox_" + n.p.id,
                                                jqm: true
                                            });
                                            a("#jqg_alrt").focus()
                                        }
                                    }
                                    return false
                                }).hover(function() {
                                    a(this).hasClass("ui-state-disabled") || a(this).addClass("ui-state-hover")
                                },
                                function() {
                                    a(this).removeClass("ui-state-hover")
                                });
                                j = null
                            }
                            if (b.del) {
                                j = a("<td class='ui-pg-button ui-corner-all'></td>");
                                x = x || {};
                                a(j).append("<div class='ui-pg-div'><span class='ui-icon " + b.delicon + "'></span>" + b.deltext + "</div>");
                                a("tr", c).append(j);
                                a(j, c).attr({
                                    title: b.deltitle || "",
                                    id: x.id || "del_" + o
                                }).click(function() {
                                    if (!a(this).hasClass("ui-state-disabled")) {
                                        var i;
                                        if (n.p.multiselect) {
                                            i = n.p.selarrrow;
                                            if (i.length === 0) i = null
                                        } else i = n.p.selrow;
                                        if (i)"function" == typeof b.delfunc ? b.delfunc(i) : a(n).jqGrid("delGridRow", i, x);
                                        else {
                                            a.jgrid.viewModal("#" + w.themodal, {
                                                gbox: "#gbox_" + n.p.id,
                                                jqm: true
                                            });
                                            a("#jqg_alrt").focus()
                                        }
                                    }
                                    return false
                                }).hover(function() {
                                    a(this).hasClass("ui-state-disabled") || a(this).addClass("ui-state-hover")
                                },
                                function() {
                                    a(this).removeClass("ui-state-hover")
                                });
                                j = null
                            }
                            if (b.add || b.edit || b.del || b.view) a("tr", c).append("<td class='ui-pg-button ui-state-disabled' style='width:4px;'><span class='ui-separator'></span></td>");
                            if (b.search) {
                                j = a("<td class='ui-pg-button ui-corner-all'></td>");
                                G = G || {};
                                a(j).append("<div class='ui-pg-div'><span class='ui-icon " + b.searchicon + "'></span>" + b.searchtext + "</div>");
                                a("tr", c).append(j);
                                a(j, c).attr({
                                    title: b.searchtitle || "",
                                    id: G.id || "search_" + o
                                }).click(function() {
                                    a(this).hasClass("ui-state-disabled") || a(n).jqGrid("searchGrid", G);
                                    return false
                                }).hover(function() {
                                    a(this).hasClass("ui-state-disabled") || a(this).addClass("ui-state-hover")
                                },
                                function() {
                                    a(this).removeClass("ui-state-hover")
                                });
                                G.showOnLoad && G.showOnLoad === true && a(j, c).click();
                                j = null
                            }
                            if (b.refresh) {
                                j = a("<td class='ui-pg-button ui-corner-all'></td>");
                                a(j).append("<div class='ui-pg-div'><span class='ui-icon " + b.refreshicon + "'></span>" + b.refreshtext + "</div>");
                                a("tr", c).append(j);
                                a(j, c).attr({
                                    title: b.refreshtitle || "",
                                    id: "refresh_" + o
                                }).click(function() {
                                    if (!a(this).hasClass("ui-state-disabled")) {
                                        a.isFunction(b.beforeRefresh) && b.beforeRefresh();
                                        n.p.search = false;
                                        try {
                                            var i = n.p.id;
                                            n.p.postData.filters = "";
                                            a("#fbox_" + i).jqFilter("resetFilter");
                                            a.isFunction(n.clearToolbar) && n.clearToolbar(false)
                                        } catch(m) {}
                                        switch (b.refreshstate) {
                                        case "firstpage":
                                            a(n).trigger("reloadGrid", [{
                                                page: 1
                                            }]);
                                            break;
                                        case "current":
                                            a(n).trigger("reloadGrid", [{
                                                current: true
                                            }])
                                        }
                                        a.isFunction(b.afterRefresh) && b.afterRefresh()
                                    }
                                    return false
                                }).hover(function() {
                                    a(this).hasClass("ui-state-disabled") || a(this).addClass("ui-state-hover")
                                },
                                function() {
                                    a(this).removeClass("ui-state-hover")
                                });
                                j = null
                            }
                            j = a(".ui-jqgrid").css("font-size") || "11px";
                            a("body").append("<div id='testpg2' class='ui-jqgrid ui-widget ui-widget-content' style='font-size:" + j + ";visibility:hidden;' ></div>");
                            j = a(c).clone().appendTo("#testpg2").width();
                            a("#testpg2").remove();
                            a(t + "_" + b.position, t).append(c);
                            if (n.p._nvtd) {
                                if (j > n.p._nvtd[0]) {
                                    a(t + "_" + b.position, t).width(j);
                                    n.p._nvtd[0] = j
                                }
                                n.p._nvtd[1] = j
                            }
                            c = j = j = null;
                            this.nav = true
                        }
                    }
                }
            })
        },
        navButtonAdd: function(f, b) {
            b = a.extend({
                caption: "newButton",
                title: "",
                buttonicon: "ui-icon-newwin",
                onClickButton: null,
                position: "last",
                cursor: "pointer"
            },
            b || {});
            return this.each(function() {
                if (this.grid) {
                    if (f.indexOf("#") !== 0) f = "#" + f;
                    var e = a(".navtable", f)[0],
                    q = this;
                    if (e) if (! (b.id && a("#" + b.id, e).html() !== null)) {
                        var x = a("<td></td>");
                        b.buttonicon.toString().toUpperCase() == "NONE" ? a(x).addClass("ui-pg-button ui-corner-all").append("<div class='ui-pg-div'>" + b.caption + "</div>") : a(x).addClass("ui-pg-button ui-corner-all").append("<div class='ui-pg-div'><span class='ui-icon " + b.buttonicon + "'></span>" + b.caption + "</div>");
                        b.id && a(x).attr("id", b.id);
                        if (b.position == "first") e.rows[0].cells.length === 0 ? a("tr", e).append(x) : a("tr td:eq(0)", e).before(x);
                        else a("tr", e).append(x);
                        a(x, e).attr("title", b.title || "").click(function(G) {
                            a(this).hasClass("ui-state-disabled") || a.isFunction(b.onClickButton) && b.onClickButton.call(q, G);
                            return false
                        }).hover(function() {
                            a(this).hasClass("ui-state-disabled") || a(this).addClass("ui-state-hover")
                        },
                        function() {
                            a(this).removeClass("ui-state-hover")
                        })
                    }
                }
            })
        },
        navSeparatorAdd: function(f, b) {
            b = a.extend({
                sepclass: "ui-separator",
                sepcontent: ""
            },
            b || {});
            return this.each(function() {
                if (this.grid) {
                    if (f.indexOf("#") !== 0) f = "#" + f;
                    var e = a(".navtable", f)[0];
                    if (e) {
                        var q = "<td class='ui-pg-button ui-state-disabled' style='width:4px;'><span class='" + b.sepclass + "'></span>" + b.sepcontent + "</td>";
                        a("tr", e).append(q)
                    }
                }
            })
        },
        GridToForm: function(f, b) {
            return this.each(function() {
                var e = this;
                if (e.grid) {
                    var q = a(e).jqGrid("getRowData", f);
                    if (q) for (var x in q) a("[name=" + a.jgrid.jqID(x) + "]", b).is("input:radio") || a("[name=" + a.jgrid.jqID(x) + "]", b).is("input:checkbox") ? a("[name=" + a.jgrid.jqID(x) + "]", b).each(function() {
                        if (a(this).val() == q[x]) a(this)[e.p.useProp ? "prop": "attr"]("checked", true);
                        else a(this)[e.p.useProp ? "prop": "attr"]("checked", false)
                    }) : a("[name=" + a.jgrid.jqID(x) + "]", b).val(q[x])
                }
            })
        },
        FormToGrid: function(f, b, e, q) {
            return this.each(function() {
                if (this.grid) {
                    e || (e = "set");
                    q || (q = "first");
                    var x = a(b).serializeArray(),
                    G = {};
                    a.each(x,
                    function(B, w) {
                        G[w.name] = w.value
                    });
                    if (e == "add") a(this).jqGrid("addRowData", f, G, q);
                    else e == "set" && a(this).jqGrid("setRowData", f, G)
                }
            })
        }
    })
})(jQuery); (function(c) {
    c.fn.jqFilter = function(k) {
        if (typeof k === "string") {
            var w = c.fn.jqFilter[k];
            if (!w) throw "jqFilter - No such method: " + k;
            var B = c.makeArray(arguments).slice(1);
            return w.apply(this, B)
        }
        var o = c.extend(true, {
            filter: null,
            columns: [],
            onChange: null,
            afterRedraw: null,
            checkValues: null,
            error: false,
            errmsg: "",
            errorcheck: true,
            showQuery: true,
            sopt: null,
            ops: [{
                name: "eq",
                description: "equal",
                operator: "="
            },
            {
                name: "ne",
                description: "not equal",
                operator: "<>"
            },
            {
                name: "lt",
                description: "less",
                operator: "<"
            },
            {
                name: "le",
                description: "less or equal",
                operator: "<="
            },
            {
                name: "gt",
                description: "greater",
                operator: ">"
            },
            {
                name: "ge",
                description: "greater or equal",
                operator: ">="
            },
            {
                name: "bw",
                description: "begins with",
                operator: "LIKE"
            },
            {
                name: "bn",
                description: "does not begin with",
                operator: "NOT LIKE"
            },
            {
                name: "in",
                description: "in",
                operator: "IN"
            },
            {
                name: "ni",
                description: "not in",
                operator: "NOT IN"
            },
            {
                name: "ew",
                description: "ends with",
                operator: "LIKE"
            },
            {
                name: "en",
                description: "does not end with",
                operator: "NOT LIKE"
            },
            {
                name: "cn",
                description: "contains",
                operator: "LIKE"
            },
            {
                name: "nc",
                description: "does not contain",
                operator: "NOT LIKE"
            },
            {
                name: "nu",
                description: "is null",
                operator: "IS NULL"
            },
            {
                name: "nn",
                description: "is not null",
                operator: "IS NOT NULL"
            }],
            numopts: ["eq", "ne", "lt", "le", "gt", "ge", "nu", "nn", "in", "ni"],
            stropts: ["eq", "ne", "bw", "bn", "ew", "en", "cn", "nc", "nu", "nn", "in", "ni"],
            _gridsopt: [],
            groupOps: [{
                op: "AND",
                text: "AND"
            },
            {
                op: "OR",
                text: "OR"
            }],
            groupButton: true,
            ruleButtons: true,
            direction: "ltr"
        },
        k || {});
        return this.each(function() {
            if (!this.filter) {
                this.p = o;
                if (this.p.filter === null || this.p.filter === undefined) this.p.filter = {
                    groupOp: this.p.groupOps[0].op,
                    rules: [],
                    groups: []
                };
                var q, x = this.p.columns.length,
                j, y = /msie/i.test(navigator.userAgent) && !window.opera;
                if (this.p._gridsopt.length) for (q = 0; q < this.p._gridsopt.length; q++) this.p.ops[q].description = this.p._gridsopt[q];
                this.p.initFilter = c.extend(true, {},
                this.p.filter);
                if (x) {
                    for (q = 0; q < x; q++) {
                        j = this.p.columns[q];
                        if (j.stype) j.inputtype = j.stype;
                        else if (!j.inputtype) j.inputtype = "text";
                        if (j.sorttype) j.searchtype = j.sorttype;
                        else if (!j.searchtype) j.searchtype = "string";
                        if (j.hidden === undefined) j.hidden = false;
                        if (!j.label) j.label = j.name;
                        if (j.index) j.name = j.index;
                        if (!j.hasOwnProperty("searchoptions")) j.searchoptions = {};
                        if (!j.hasOwnProperty("searchrules")) j.searchrules = {}
                    }
                    this.p.showQuery && c(this).append("<table class='queryresult ui-widget ui-widget-content' style='display:block;max-width:440px;border:0px none;' dir='" + this.p.direction + "'><tbody><tr><td class='query'></td></tr></tbody></table>");
                    var z = function(d, g) {
                        var a = [true, ""];
                        if (c.isFunction(g.searchrules)) a = g.searchrules(d, g);
                        else if (c.jgrid && c.jgrid.checkValues) try {
                            a = c.jgrid.checkValues(d, -1, null, g.searchrules, g.label)
                        } catch(b) {}
                        if (a && a.length && a[0] === false) {
                            o.error = !a[0];
                            o.errmsg = a[1]
                        }
                    };
                    this.onchange = function() {
                        this.p.error = false;
                        this.p.errmsg = "";
                        return c.isFunction(this.p.onChange) ? this.p.onChange.call(this, this.p) : false
                    };
                    this.reDraw = function() {
                        c("table.group:first", this).remove();
                        var d = this.createTableForGroup(o.filter, null);
                        c(this).append(d);
                        c.isFunction(this.p.afterRedraw) && this.p.afterRedraw.call(this, this.p)
                    };
                    this.createTableForGroup = function(d, g) {
                        var a = this,
                        b, e = c("<table class='group ui-widget ui-widget-content' style='border:0px none;'><tbody></tbody></table>"),
                        i = "left";
                        if (this.p.direction == "rtl") {
                            i = "right";
                            e.attr("dir", "rtl")
                        }
                        g === null && e.append("<tr class='error' style='display:none;'><th colspan='5' class='ui-state-error' align='" + i + "'></th></tr>");
                        var f = c("<tr></tr>");
                        e.append(f);
                        i = c("<th colspan='5' align='" + i + "'></th>");
                        f.append(i);
                        if (this.p.ruleButtons === true) {
                            var h = c("<select class='opsel'></select>");
                            i.append(h);
                            f = "";
                            var l;
                            for (b = 0; b < o.groupOps.length; b++) {
                                l = d.groupOp === a.p.groupOps[b].op ? " selected='selected'": "";
                                f += "<option value='" + a.p.groupOps[b].op + "'" + l + ">" + a.p.groupOps[b].text + "</option>"
                            }
                            h.append(f).bind("change",
                            function() {
                                d.groupOp = c(h).val();
                                a.onchange()
                            })
                        }
                        f = "<span></span>";
                        if (this.p.groupButton) {
                            f = c("<input type='button' value='+ {}' title='Add subgroup' class='add-group'/>");
                            f.bind("click",
                            function() {
                                if (d.groups === undefined) d.groups = [];
                                d.groups.push({
                                    groupOp: o.groupOps[0].op,
                                    rules: [],
                                    groups: []
                                });
                                a.reDraw();
                                a.onchange();
                                return false
                            })
                        }
                        i.append(f);
                        if (this.p.ruleButtons === true) {
                            f = c("<input type='button' value='+' title='Add rule' class='add-rule ui-add'/>");
                            var m;
                            f.bind("click",
                            function() {
                                if (d.rules === undefined) d.rules = [];
                                for (b = 0; b < a.p.columns.length; b++) {
                                    var n = typeof a.p.columns[b].search === "undefined" ? true: a.p.columns[b].search,
                                    s = a.p.columns[b].hidden === true;
                                    if (a.p.columns[b].searchoptions.searchhidden === true && n || n && !s) {
                                        m = a.p.columns[b];
                                        break
                                    }
                                }
                                d.rules.push({
                                    field: m.name,
                                    op: (m.searchoptions.sopt ? m.searchoptions.sopt: a.p.sopt ? a.p.sopt: m.searchtype === "string" ? a.p.stropts: a.p.numopts)[0],
                                    data: ""
                                });
                                a.reDraw();
                                return false
                            });
                            i.append(f)
                        }
                        if (g !== null) {
                            f = c("<input type='button' value='-' title='Delete group' class='delete-group'/>");
                            i.append(f);
                            f.bind("click",
                            function() {
                                for (b = 0; b < g.groups.length; b++) if (g.groups[b] === d) {
                                    g.groups.splice(b, 1);
                                    break
                                }
                                a.reDraw();
                                a.onchange();
                                return false
                            })
                        }
                        if (d.groups !== undefined) for (b = 0; b < d.groups.length; b++) {
                            i = c("<tr></tr>");
                            e.append(i);
                            f = c("<td class='first'></td>");
                            i.append(f);
                            f = c("<td colspan='4'></td>");
                            f.append(this.createTableForGroup(d.groups[b], d));
                            i.append(f)
                        }
                        if (d.groupOp === undefined) d.groupOp = a.p.groupOps[0].op;
                        if (d.rules !== undefined) for (b = 0; b < d.rules.length; b++) e.append(this.createTableRowForRule(d.rules[b], d));
                        return e
                    };
                    this.createTableRowForRule = function(d, g) {
                        var a = this,
                        b = c("<tr></tr>"),
                        e,
                        i,
                        f,
                        h,
                        l = "",
                        m;
                        b.append("<td class='first'></td>");
                        var n = c("<td class='columns'></td>");
                        b.append(n);
                        var s = c("<select></select>"),
                        p,
                        t = [];
                        n.append(s);
                        s.bind("change",
                        function() {
                            d.field = c(s).val();
                            f = c(this).parents("tr:first");
                            for (e = 0; e < a.p.columns.length; e++) if (a.p.columns[e].name === d.field) {
                                h = a.p.columns[e];
                                break
                            }
                            if (h) {
                                h.searchoptions.id = c.jgrid.randId();
                                if (y && h.inputtype === "text") if (!h.searchoptions.size) h.searchoptions.size = 10;
                                var r = c.jgrid.createEl(h.inputtype, h.searchoptions, "", true, a.p.ajaxSelectOptions, true);
                                c(r).addClass("input-elm");
                                i = h.searchoptions.sopt ? h.searchoptions.sopt: a.p.sopt ? a.p.sopt: h.searchtype === "string" ? a.p.stropts: a.p.numopts;
                                var u = "",
                                A = 0;
                                t = [];
                                c.each(a.p.ops,
                                function() {
                                    t.push(this.name)
                                });
                                for (e = 0; e < i.length; e++) {
                                    p = c.inArray(i[e], t);
                                    if (p !== -1) {
                                        if (A === 0) d.op = a.p.ops[p].name;
                                        u += "<option value='" + a.p.ops[p].name + "'>" + a.p.ops[p].description + "</option>";
                                        A++
                                    }
                                }
                                c(".selectopts", f).empty().append(u);
                                c(".selectopts", f)[0].selectedIndex = 0;
                                if (c.browser.msie && c.browser.version < 9) {
                                    u = parseInt(c("select.selectopts", f)[0].offsetWidth) + 1;
                                    c(".selectopts", f).width(u);
                                    c(".selectopts", f).css("width", "auto")
                                }
                                c(".data", f).empty().append(r);
                                c(".input-elm", f).bind("change",
                                function() {
                                    d.data = c(this).val();
                                    a.onchange()
                                });
                                setTimeout(function() {
                                    d.data = c(r).val();
                                    a.onchange()
                                },
                                0)
                            }
                        });
                        for (e = n = 0; e < a.p.columns.length; e++) {
                            m = typeof a.p.columns[e].search === "undefined" ? true: a.p.columns[e].search;
                            var C = a.p.columns[e].hidden === true;
                            if (a.p.columns[e].searchoptions.searchhidden === true && m || m && !C) {
                                m = "";
                                if (d.field === a.p.columns[e].name) {
                                    m = " selected='selected'";
                                    n = e
                                }
                                l += "<option value='" + a.p.columns[e].name + "'" + m + ">" + a.p.columns[e].label + "</option>"
                            }
                        }
                        s.append(l);
                        l = c("<td class='operators'></td>");
                        b.append(l);
                        h = o.columns[n];
                        h.searchoptions.id = c.jgrid.randId();
                        if (y && h.inputtype === "text") if (!h.searchoptions.size) h.searchoptions.size = 10;
                        n = c.jgrid.createEl(h.inputtype, h.searchoptions, d.data, true, a.p.ajaxSelectOptions, true);
                        var v = c("<select class='selectopts'></select>");
                        l.append(v);
                        v.bind("change",
                        function() {
                            d.op = c(v).val();
                            f = c(this).parents("tr:first");
                            var r = c(".input-elm", f)[0];
                            if (d.op === "nu" || d.op === "nn") {
                                d.data = "";
                                r.value = "";
                                r.setAttribute("readonly", "true");
                                r.setAttribute("disabled", "true")
                            } else {
                                r.removeAttribute("readonly");
                                r.removeAttribute("disabled")
                            }
                            a.onchange()
                        });
                        i = h.searchoptions.sopt ? h.searchoptions.sopt: a.p.sopt ? a.p.sopt: h.searchtype === "string" ? o.stropts: a.p.numopts;
                        l = "";
                        c.each(a.p.ops,
                        function() {
                            t.push(this.name)
                        });
                        for (e = 0; e < i.length; e++) {
                            p = c.inArray(i[e], t);
                            if (p !== -1) {
                                m = d.op === a.p.ops[p].name ? " selected='selected'": "";
                                l += "<option value='" + a.p.ops[p].name + "'" + m + ">" + a.p.ops[p].description + "</option>"
                            }
                        }
                        v.append(l);
                        l = c("<td class='data'></td>");
                        b.append(l);
                        l.append(n);
                        c(n).addClass("input-elm").bind("change",
                        function() {
                            d.data = c(this).val();
                            a.onchange()
                        });
                        l = c("<td></td>");
                        b.append(l);
                        if (this.p.ruleButtons === true) {
                            n = c("<input type='button' value='-' title='Delete rule' class='delete-rule ui-del'/>");
                            l.append(n);
                            n.bind("click",
                            function() {
                                for (e = 0; e < g.rules.length; e++) if (g.rules[e] === d) {
                                    g.rules.splice(e, 1);
                                    break
                                }
                                a.reDraw();
                                a.onchange();
                                return false
                            })
                        }
                        return b
                    };
                    this.getStringForGroup = function(d) {
                        var g = "(",
                        a;
                        if (d.groups !== undefined) for (a = 0; a < d.groups.length; a++) {
                            if (g.length > 1) g += " " + d.groupOp + " ";
                            try {
                                g += this.getStringForGroup(d.groups[a])
                            } catch(b) {
                                alert(b)
                            }
                        }
                        if (d.rules !== undefined) try {
                            for (a = 0; a < d.rules.length; a++) {
                                if (g.length > 1) g += " " + d.groupOp + " ";
                                g += this.getStringForRule(d.rules[a])
                            }
                        } catch(e) {
                            alert(e)
                        }
                        g += ")";
                        return g === "()" ? "": g
                    };
                    this.getStringForRule = function(d) {
                        var g = "",
                        a = "",
                        b, e;
                        for (b = 0; b < this.p.ops.length; b++) if (this.p.ops[b].name === d.op) {
                            g = this.p.ops[b].operator;
                            a = this.p.ops[b].name;
                            break
                        }
                        for (b = 0; b < this.p.columns.length; b++) if (this.p.columns[b].name === d.field) {
                            e = this.p.columns[b];
                            break
                        }
                        b = d.data;
                        if (a === "bw" || a === "bn") b += "%";
                        if (a === "ew" || a === "en") b = "%" + b;
                        if (a === "cn" || a === "nc") b = "%" + b + "%";
                        if (a === "in" || a === "ni") b = " (" + b + ")";
                        o.errorcheck && z(d.data, e);
                        return c.inArray(e.searchtype, ["int", "integer", "float", "number", "currency"]) !== -1 || a === "nn" || a === "nu" ? d.field + " " + g + " " + b: d.field + " " + g + ' "' + b + '"'
                    };
                    this.resetFilter = function() {
                        this.p.filter = c.extend(true, {},
                        this.p.initFilter);
                        this.reDraw();
                        this.onchange()
                    };
                    this.hideError = function() {
                        c("th.ui-state-error", this).html("");
                        c("tr.error", this).hide()
                    };
                    this.showError = function() {
                        c("th.ui-state-error", this).html(this.p.errmsg);
                        c("tr.error", this).show()
                    };
                    this.toUserFriendlyString = function() {
                        return this.getStringForGroup(o.filter)
                    };
                    this.toString = function() {
                        function d(a) {
                            var b = "(",
                            e;
                            if (a.groups !== undefined) for (e = 0; e < a.groups.length; e++) {
                                if (b.length > 1) b += a.groupOp === "OR" ? " || ": " && ";
                                b += d(a.groups[e])
                            }
                            if (a.rules !== undefined) for (e = 0; e < a.rules.length; e++) {
                                if (b.length > 1) b += a.groupOp === "OR" ? " || ": " && ";
                                var i = a.rules[e];
                                if (g.p.errorcheck) {
                                    var f = void 0,
                                    h = void 0;
                                    for (f = 0; f < g.p.columns.length; f++) if (g.p.columns[f].name === i.field) {
                                        h = g.p.columns[f];
                                        break
                                    }
                                    h && z(i.data, h)
                                }
                                b += i.op + "(item." + i.field + ",'" + i.data + "')"
                            }
                            b += ")";
                            return b === "()" ? "": b
                        }
                        var g = this;
                        return d(this.p.filter)
                    };
                    this.reDraw();
                    if (this.p.showQuery) this.onchange();
                    this.filter = true
                }
            }
        })
    };
    c.extend(c.fn.jqFilter, {
        toSQLString: function() {
            var k = "";
            this.each(function() {
                k = this.toUserFriendlyString()
            });
            return k
        },
        filterData: function() {
            var k;
            this.each(function() {
                k = this.p.filter
            });
            return k
        },
        getParameter: function(k) {
            if (k !== undefined) if (this.p.hasOwnProperty(k)) return this.p[k];
            return this.p
        },
        resetFilter: function() {
            return this.each(function() {
                this.resetFilter()
            })
        },
        addFilter: function(k) {
            if (typeof k === "string") k = jQuery.jgrid.parse(k);
            this.each(function() {
                this.p.filter = k;
                this.reDraw();
                this.onchange()
            })
        }
    })
})(jQuery); (function(a) {
    a.jgrid.inlineEdit = a.jgrid.inlineEdit || {};
    a.jgrid.extend({
        editRow: function(c, d, b, h, l, n, s, o, f) {
            var m = {},
            g = a.makeArray(arguments).slice(1);
            if (a.jgrid.realType(g[0]) === "Object") m = g[0];
            else {
                if (typeof d !== "undefined") m.keys = d;
                if (a.isFunction(b)) m.oneditfunc = b;
                if (a.isFunction(h)) m.successfunc = h;
                if (typeof l !== "undefined") m.url = l;
                if (typeof n !== "undefined") m.extraparam = n;
                if (a.isFunction(s)) m.aftersavefunc = s;
                if (a.isFunction(o)) m.errorfunc = o;
                if (a.isFunction(f)) m.afterrestorefunc = f
            }
            m = a.extend(true, {
                keys: false,
                oneditfunc: null,
                successfunc: null,
                url: null,
                extraparam: {},
                aftersavefunc: null,
                errorfunc: null,
                afterrestorefunc: null,
                restoreAfterError: true,
                mtype: "POST"
            },
            a.jgrid.inlineEdit, m);
            return this.each(function() {
                var i = this,
                e, q, w = 0,
                x = null,
                v = {},
                r, j;
                if (i.grid) {
                    r = a(i).jqGrid("getInd", c, true);
                    if (r !== false) if ((a(r).attr("editable") || "0") == "0" && !a(r).hasClass("not-editable-row")) {
                        j = i.p.colModel;
                        a('td[role="gridcell"]', r).each(function(k) {
                            e = j[k].name;
                            var z = i.p.treeGrid === true && e == i.p.ExpandColumn;
                            if (z) q = a("span:first", this).html();
                            else try {
                                q = a.unformat(this, {
                                    rowId: c,
                                    colModel: j[k]
                                },
                                k)
                            } catch(A) {
                                q = j[k].edittype && j[k].edittype == "textarea" ? a(this).text() : a(this).html()
                            }
                            if (e != "cb" && e != "subgrid" && e != "rn") {
                                if (i.p.autoencode) q = a.jgrid.htmlDecode(q);
                                v[e] = q;
                                if (j[k].editable === true) {
                                    if (x === null) x = k;
                                    z ? a("span:first", this).html("") : a(this).html("");
                                    var p = a.extend({},
                                    j[k].editoptions || {},
                                    {
                                        id: c + "_" + e,
                                        name: e
                                    });
                                    if (!j[k].edittype) j[k].edittype = "text";
                                    if (q == "&nbsp;" || q == "&#160;" || q.length == 1 && q.charCodeAt(0) == 160) q = "";
                                    p = a.jgrid.createEl(j[k].edittype, p, q, true, a.extend({},
                                    a.jgrid.ajaxOptions, i.p.ajaxSelectOptions || {}));
                                    a(p).addClass("editable");
                                    z ? a("span:first", this).append(p) : a(this).append(p);
                                    j[k].edittype == "select" && typeof j[k].editoptions !== "undefined" && j[k].editoptions.multiple === true && typeof j[k].editoptions.dataUrl === "undefined" && a.browser.msie && a(p).width(a(p).width());
                                    w++
                                }
                            }
                        });
                        if (w > 0) {
                            v.id = c;
                            i.p.savedRow.push(v);
                            a(r).attr("editable", "1");
                            a("td:eq(" + x + ") input", r).focus();
                            m.keys === true && a(r).bind("keydown",
                            function(k) {
                                if (k.keyCode === 27) {
                                    a(i).jqGrid("restoreRow", c, f);
                                    return false
                                }
                                if (k.keyCode === 13) {
                                    if (k.target.tagName == "TEXTAREA") return true;
                                    a(i).jqGrid("saveRow", c, m);
                                    return false
                                }
                            });
                            a.isFunction(m.oneditfunc) && m.oneditfunc.call(i, c)
                        }
                    }
                }
            })
        },
        saveRow: function(c, d, b, h, l, n, s) {
            var o = a.makeArray(arguments).slice(1),
            f = {};
            if (a.jgrid.realType(o[0]) === "Object") f = o[0];
            else {
                if (a.isFunction(d)) f.successfunc = d;
                if (typeof b !== "undefined") f.url = b;
                if (typeof h !== "undefined") f.extraparam = h;
                if (a.isFunction(l)) f.aftersavefunc = l;
                if (a.isFunction(n)) f.errorfunc = n;
                if (a.isFunction(s)) f.afterrestorefunc = s
            }
            f = a.extend(true, {
                successfunc: null,
                url: null,
                extraparam: {},
                aftersavefunc: null,
                errorfunc: null,
                afterrestorefunc: null,
                restoreAfterError: true,
                mtype: "POST"
            },
            a.jgrid.inlineEdit, f);
            var m = false,
            g = this[0],
            i,
            e = {},
            q = {},
            w = {},
            x,
            v,
            r;
            if (!g.grid) return m;
            r = a(g).jqGrid("getInd", c, true);
            if (r === false) return m;
            o = a(r).attr("editable");
            f.url = f.url ? f.url: g.p.editurl;
            if (o === "1") {
                var j;
                a('td[role="gridcell"]', r).each(function(p) {
                    j = g.p.colModel[p];
                    i = j.name;
                    if (i != "cb" && i != "subgrid" && j.editable === true && i != "rn" && !a(this).hasClass("not-editable-cell")) {
                        switch (j.edittype) {
                        case "checkbox":
                            var t = ["Yes", "No"];
                            if (j.editoptions) t = j.editoptions.value.split(":");
                            e[i] = a("input", this).is(":checked") ? t[0] : t[1];
                            break;
                        case "text":
                        case "password":
                        case "textarea":
                        case "button":
                            e[i] = a("input, textarea", this).val();
                            break;
                        case "select":
                            if (j.editoptions.multiple) {
                                t = a("select", this);
                                var u = [];
                                e[i] = a(t).val();
                                e[i] = e[i] ? e[i].join(",") : "";
                                a("select option:selected", this).each(function(B, C) {
                                    u[B] = a(C).text()
                                });
                                q[i] = u.join(",")
                            } else {
                                e[i] = a("select option:selected", this).val();
                                q[i] = a("select option:selected", this).text()
                            }
                            if (j.formatter && j.formatter == "select") q = {};
                            break;
                        case "custom":
                            try {
                                if (j.editoptions && a.isFunction(j.editoptions.custom_value)) {
                                    e[i] = j.editoptions.custom_value.call(g, a(".customelement", this), "get");
                                    if (e[i] === undefined) throw "e2";
                                } else throw "e1";
                            } catch(y) {
                                y == "e1" && a.jgrid.info_dialog(a.jgrid.errors.errcap, "function 'custom_value' " + a.jgrid.edit.msg.nodefined, a.jgrid.edit.bClose);
                                y == "e2" ? a.jgrid.info_dialog(a.jgrid.errors.errcap, "function 'custom_value' " + a.jgrid.edit.msg.novalue, a.jgrid.edit.bClose) : a.jgrid.info_dialog(a.jgrid.errors.errcap, y.message, a.jgrid.edit.bClose)
                            }
                        }
                        v = a.jgrid.checkValues(e[i], p, g);
                        if (v[0] === false) {
                            v[1] = e[i] + " " + v[1];
                            return false
                        }
                        if (g.p.autoencode) e[i] = a.jgrid.htmlEncode(e[i]);
                        if (f.url !== "clientArray" && j.editoptions && j.editoptions.NullIfEmpty === true) if (e[i] === "") w[i] = "null"
                    }
                });
                if (v[0] === false) {
                    try {
                        var k = a.jgrid.findPos(a("#" + a.jgrid.jqID(c), g.grid.bDiv)[0]);
                        a.jgrid.info_dialog(a.jgrid.errors.errcap, v[1], a.jgrid.edit.bClose, {
                            left: k[0],
                            top: k[1]
                        })
                    } catch(z) {
                        alert(v[1])
                    }
                    return m
                }
                var A;
                o = g.p.prmNames;
                A = o.oper;
                k = o.id;
                if (e) {
                    e[A] = o.editoper;
                    e[k] = c;
                    if (typeof g.p.inlineData == "undefined") g.p.inlineData = {};
                    e = a.extend({},
                    e, g.p.inlineData, f.extraparam)
                }
                if (f.url == "clientArray") {
                    e = a.extend({},
                    e, q);
                    g.p.autoencode && a.each(e,
                    function(p, t) {
                        e[p] = a.jgrid.htmlDecode(t)
                    });
                    k = a(g).jqGrid("setRowData", c, e);
                    a(r).attr("editable", "0");
                    for (o = 0; o < g.p.savedRow.length; o++) if (g.p.savedRow[o].id == c) {
                        x = o;
                        break
                    }
                    x >= 0 && g.p.savedRow.splice(x, 1);
                    a.isFunction(f.aftersavefunc) && f.aftersavefunc.call(g, c, k);
                    m = true;
                    a(r).unbind("keydown")
                } else {
                    a("#lui_" + g.p.id).show();
                    w = a.extend({},
                    e, w);
                    w[k] = a.jgrid.stripPref(g.p.idPrefix, w[k]);
                    a.ajax(a.extend({
                        url: f.url,
                        data: a.isFunction(g.p.serializeRowData) ? g.p.serializeRowData.call(g, w) : w,
                        type: f.mtype,
                        async: false,
                        complete: function(p, t) {
                            a("#lui_" + g.p.id).hide();
                            if (t === "success") {
                                var u = true,
                                y;
                                if (a.isFunction(f.successfunc)) {
                                    y = f.successfunc.call(g, p);
                                    if (a.isArray(y)) {
                                        u = y[0];
                                        e = y[1] ? y[1] : e
                                    } else u = y
                                }
                                if (u === true) {
                                    g.p.autoencode && a.each(e,
                                    function(B, C) {
                                        e[B] = a.jgrid.htmlDecode(C)
                                    });
                                    e = a.extend({},
                                    e, q);
                                    a(g).jqGrid("setRowData", c, e);
                                    a(r).attr("editable", "0");
                                    for (u = 0; u < g.p.savedRow.length; u++) if (g.p.savedRow[u].id == c) {
                                        x = u;
                                        break
                                    }
                                    x >= 0 && g.p.savedRow.splice(x, 1);
                                    a.isFunction(f.aftersavefunc) && f.aftersavefunc.call(g, c, p);
                                    m = true;
                                    a(r).unbind("keydown")
                                } else {
                                    a.isFunction(f.errorfunc) && f.errorfunc.call(g, c, p, t);
                                    f.restoreAfterError === true && a(g).jqGrid("restoreRow", c, f.afterrestorefunc)
                                }
                            }
                        },
                        error: function(p, t) {
                            a("#lui_" + g.p.id).hide();
                            if (a.isFunction(f.errorfunc)) f.errorfunc.call(g, c, p, t);
                            else try {
                                a.jgrid.info_dialog(a.jgrid.errors.errcap, '<div class="ui-state-error">' + p.responseText + "</div>", a.jgrid.edit.bClose, {
                                    buttonalign: "right"
                                })
                            } catch(u) {
                                alert(p.responseText)
                            }
                            f.restoreAfterError === true && a(g).jqGrid("restoreRow", c, f.afterrestorefunc)
                        }
                    },
                    a.jgrid.ajaxOptions, g.p.ajaxRowOptions || {}))
                }
            }
            return m
        },
        restoreRow: function(c, d) {
            var b = a.makeArray(arguments).slice(1),
            h = {};
            if (a.jgrid.realType(b[0]) === "Object") h = b[0];
            else if (a.isFunction(d)) h.afterrestorefunc = d;
            h = a.extend(true, a.jgrid.inlineEdit, h);
            return this.each(function() {
                var l = this,
                n, s, o = {};
                if (l.grid) {
                    s = a(l).jqGrid("getInd", c, true);
                    if (s !== false) {
                        for (var f = 0; f < l.p.savedRow.length; f++) if (l.p.savedRow[f].id == c) {
                            n = f;
                            break
                        }
                        if (n >= 0) {
                            if (a.isFunction(a.fn.datepicker)) try {
                                a("input.hasDatepicker", "#" + a.jgrid.jqID(s.id)).datepicker("hide")
                            } catch(m) {}
                            a.each(l.p.colModel,
                            function() {
                                if (this.editable === true && this.name in l.p.savedRow[n] && !a(this).hasClass("not-editable-cell")) o[this.name] = l.p.savedRow[n][this.name]
                            });
                            a(l).jqGrid("setRowData", c, o);
                            a(s).attr("editable", "0").unbind("keydown");
                            l.p.savedRow.splice(n, 1);
                            a("#" + a.jgrid.jqID(c), "#" + a.jgrid.jqID(l.p.id)).hasClass("jqgrid-new-row") && setTimeout(function() {
                                a(l).jqGrid("delRowData", c)
                            },
                            0)
                        }
                        a.isFunction(h.afterrestorefunc) && h.afterrestorefunc.call(l, c)
                    }
                }
            })
        },
        addRow: function(c) {
            c = a.extend(true, {
                rowID: "new_row",
                initdata: {},
                position: "first",
                useDefValues: true,
                useFormatter: false,
                addRowParams: {
                    extraparam: {}
                }
            },
            c || {});
            return this.each(function() {
                if (this.grid) {
                    var d = this;
                    c.useDefValues === true && a(d.p.colModel).each(function() {
                        if (this.editoptions && this.editoptions.defaultValue) {
                            var h = this.editoptions.defaultValue;
                            h = a.isFunction(h) ? h.call(d) : h;
                            c.initdata[this.name] = h
                        }
                    });
                    a(d).jqGrid("addRowData", c.rowID, c.initdata, c.position);
                    a("#" + a.jgrid.jqID(c.rowID), "#" + a.jgrid.jqID(d.p.id)).addClass("jqgrid-new-row");
                    if (c.useFormatter) a("#" + a.jgrid.jqID(c.rowID) + " .ui-inline-edit", "#" + a.jgrid.jqID(d.p.id)).click();
                    else {
                        var b = d.p.prmNames;
                        c.addRowParams.extraparam[b.oper] = b.addoper;
                        a(d).jqGrid("editRow", c.rowID, c.addRowParams);
                        a(d).jqGrid("setSelection", c.rowID)
                    }
                }
            })
        },
        inlineNav: function(c, d) {
            d = a.extend({
                edit: true,
                editicon: "ui-icon-pencil",
                add: true,
                addicon: "ui-icon-plus",
                save: true,
                saveicon: "ui-icon-disk",
                cancel: true,
                cancelicon: "ui-icon-cancel",
                addParams: {
                    useFormatter: false
                },
                editParams: {}
            },
            a.jgrid.nav, d || {});
            return this.each(function() {
                if (this.grid) {
                    var b = this;
                    if (d.addParams.useFormatter === true) {
                        var h = b.p.colModel,
                        l;
                        for (l = 0; l < h.length; l++) if (h[l].formatter && h[l].formatter === "actions") {
                            if (h[l].formatoptions) {
                                h = a.extend({
                                    keys: false,
                                    onEdit: null,
                                    onSuccess: null,
                                    afterSave: null,
                                    onError: null,
                                    afterRestore: null,
                                    extraparam: {},
                                    url: null
                                },
                                h[l].formatoptions);
                                d.addParams.addRowParams = {
                                    keys: h.keys,
                                    oneditfunc: h.onEdit,
                                    successfunc: h.onSuccess,
                                    url: h.url,
                                    extraparam: h.extraparam,
                                    aftersavefunc: h.afterSavef,
                                    errorfunc: h.onError,
                                    afterrestorefunc: h.afterRestore
                                }
                            }
                            break
                        }
                    }
                    d.add && a(b).jqGrid("navButtonAdd", c, {
                        caption: d.addtext,
                        title: d.addtitle,
                        buttonicon: d.addicon,
                        id: b.p.id + "_iladd",
                        onClickButton: function() {
                            a(b).jqGrid("addRow", d.addParams);
                            if (!d.addParams.useFormatter) {
                                a("#" + b.p.id + "_ilsave").removeClass("ui-state-disabled");
                                a("#" + b.p.id + "_ilcancel").removeClass("ui-state-disabled");
                                a("#" + b.p.id + "_iladd").addClass("ui-state-disabled");
                                a("#" + b.p.id + "_iledit").addClass("ui-state-disabled")
                            }
                        }
                    });
                    d.edit && a(b).jqGrid("navButtonAdd", c, {
                        caption: d.edittext,
                        title: d.edittitle,
                        buttonicon: d.editicon,
                        id: b.p.id + "_iledit",
                        onClickButton: function() {
                            var n = a(b).jqGrid("getGridParam", "selrow");
                            if (n) {
                                a(b).jqGrid("editRow", n, d.editParams);
                                a("#" + b.p.id + "_ilsave").removeClass("ui-state-disabled");
                                a("#" + b.p.id + "_ilcancel").removeClass("ui-state-disabled");
                                a("#" + b.p.id + "_iladd").addClass("ui-state-disabled");
                                a("#" + b.p.id + "_iledit").addClass("ui-state-disabled")
                            } else {
                                a.jgrid.viewModal("#alertmod", {
                                    gbox: "#gbox_" + b.p.id,
                                    jqm: true
                                });
                                a("#jqg_alrt").focus()
                            }
                        }
                    });
                    if (d.save) {
                        a(b).jqGrid("navButtonAdd", c, {
                            caption: d.savetext || "",
                            title: d.savetitle || "Save row",
                            buttonicon: d.saveicon,
                            id: b.p.id + "_ilsave",
                            onClickButton: function() {
                                var n = b.p.savedRow[0].id;
                                if (n) {
                                    if (a("#" + a.jgrid.jqID(n), "#" + a.jgrid.jqID(b.p.id)).hasClass("jqgrid-new-row")) {
                                        var s = b.p.prmNames,
                                        o = s.oper;
                                        if (!d.editParams.extraparam) d.editParams.extraparam = {};
                                        d.editParams.extraparam[o] = s.addoper
                                    }
                                    if (a(b).jqGrid("saveRow", n, d.editParams)) {
                                        a("#" + b.p.id + "_ilsave").addClass("ui-state-disabled");
                                        a("#" + b.p.id + "_ilcancel").addClass("ui-state-disabled");
                                        a("#" + b.p.id + "_iladd").removeClass("ui-state-disabled");
                                        a("#" + b.p.id + "_iledit").removeClass("ui-state-disabled")
                                    }
                                } else {
                                    a.jgrid.viewModal("#alertmod", {
                                        gbox: "#gbox_" + b.p.id,
                                        jqm: true
                                    });
                                    a("#jqg_alrt").focus()
                                }
                            }
                        });
                        a("#" + b.p.id + "_ilsave").addClass("ui-state-disabled")
                    }
                    if (d.cancel) {
                        a(b).jqGrid("navButtonAdd", c, {
                            caption: d.canceltext || "",
                            title: d.canceltitle || "Cancel row editing",
                            buttonicon: d.cancelicon,
                            id: b.p.id + "_ilcancel",
                            onClickButton: function() {
                                var n = b.p.savedRow[0].id;
                                if (n) {
                                    a(b).jqGrid("restoreRow", n, d.editParams);
                                    a("#" + b.p.id + "_ilsave").addClass("ui-state-disabled");
                                    a("#" + b.p.id + "_ilcancel").addClass("ui-state-disabled");
                                    a("#" + b.p.id + "_iladd").removeClass("ui-state-disabled");
                                    a("#" + b.p.id + "_iledit").removeClass("ui-state-disabled")
                                } else {
                                    a.jgrid.viewModal("#alertmod", {
                                        gbox: "#gbox_" + b.p.id,
                                        jqm: true
                                    });
                                    a("#jqg_alrt").focus()
                                }
                            }
                        });
                        a("#" + b.p.id + "_ilcancel").addClass("ui-state-disabled")
                    }
                }
            })
        }
    })
})(jQuery); (function(b) {
    b.jgrid.extend({
        editCell: function(d, f, a) {
            return this.each(function() {
                var c = this,
                h, e, g, i;
                if (! (!c.grid || c.p.cellEdit !== true)) {
                    f = parseInt(f, 10);
                    c.p.selrow = c.rows[d].id;
                    c.p.knv || b(c).jqGrid("GridNav");
                    if (c.p.savedRow.length > 0) {
                        if (a === true) if (d == c.p.iRow && f == c.p.iCol) return;
                        b(c).jqGrid("saveCell", c.p.savedRow[0].id, c.p.savedRow[0].ic)
                    } else window.setTimeout(function() {
                        b("#" + c.p.knv).attr("tabindex", "-1").focus()
                    },
                    0);
                    i = c.p.colModel[f];
                    h = i.name;
                    if (! (h == "subgrid" || h == "cb" || h == "rn")) {
                        g = b("td:eq(" + f + ")", c.rows[d]);
                        if (i.editable === true && a === true && !g.hasClass("not-editable-cell")) {
                            if (parseInt(c.p.iCol, 10) >= 0 && parseInt(c.p.iRow, 10) >= 0) {
                                b("td:eq(" + c.p.iCol + ")", c.rows[c.p.iRow]).removeClass("edit-cell ui-state-highlight");
                                b(c.rows[c.p.iRow]).removeClass("selected-row ui-state-hover")
                            }
                            b(g).addClass("edit-cell ui-state-highlight");
                            b(c.rows[d]).addClass("selected-row ui-state-hover");
                            try {
                                e = b.unformat(g, {
                                    rowId: c.rows[d].id,
                                    colModel: i
                                },
                                f)
                            } catch(k) {
                                e = i.edittype && i.edittype == "textarea" ? b(g).text() : b(g).html()
                            }
                            if (c.p.autoencode) e = b.jgrid.htmlDecode(e);
                            if (!i.edittype) i.edittype = "text";
                            c.p.savedRow.push({
                                id: d,
                                ic: f,
                                name: h,
                                v: e
                            });
                            if (e == "&nbsp;" || e == "&#160;" || e.length == 1 && e.charCodeAt(0) == 160) e = "";
                            if (b.isFunction(c.p.formatCell)) {
                                var j = c.p.formatCell.call(c, c.rows[d].id, h, e, d, f);
                                if (j !== undefined) e = j
                            }
                            j = b.extend({},
                            i.editoptions || {},
                            {
                                id: d + "_" + h,
                                name: h
                            });
                            var m = b.jgrid.createEl(i.edittype, j, e, true, b.extend({},
                            b.jgrid.ajaxOptions, c.p.ajaxSelectOptions || {}));
                            b.isFunction(c.p.beforeEditCell) && c.p.beforeEditCell.call(c, c.rows[d].id, h, e, d, f);
                            b(g).html("").append(m).attr("tabindex", "0");
                            window.setTimeout(function() {
                                b(m).focus()
                            },
                            0);
                            b("input, select, textarea", g).bind("keydown",
                            function(l) {
                                if (l.keyCode === 27) if (b("input.hasDatepicker", g).length > 0) b(".ui-datepicker").is(":hidden") ? b(c).jqGrid("restoreCell", d, f) : b("input.hasDatepicker", g).datepicker("hide");
                                else b(c).jqGrid("restoreCell", d, f);
                                l.keyCode === 13 && b(c).jqGrid("saveCell", d, f);
                                if (l.keyCode == 9) if (c.grid.hDiv.loading) return false;
                                else l.shiftKey ? b(c).jqGrid("prevCell", d, f) : b(c).jqGrid("nextCell", d, f);
                                l.stopPropagation()
                            });
                            b.isFunction(c.p.afterEditCell) && c.p.afterEditCell.call(c, c.rows[d].id, h, e, d, f)
                        } else {
                            if (parseInt(c.p.iCol, 10) >= 0 && parseInt(c.p.iRow, 10) >= 0) {
                                b("td:eq(" + c.p.iCol + ")", c.rows[c.p.iRow]).removeClass("edit-cell ui-state-highlight");
                                b(c.rows[c.p.iRow]).removeClass("selected-row ui-state-hover")
                            }
                            g.addClass("edit-cell ui-state-highlight");
                            b(c.rows[d]).addClass("selected-row ui-state-hover");
                            if (b.isFunction(c.p.onSelectCell)) {
                                e = g.html().replace(/\&#160\;/ig, "");
                                c.p.onSelectCell.call(c, c.rows[d].id, h, e, d, f)
                            }
                        }
                        c.p.iCol = f;
                        c.p.iRow = d
                    }
                }
            })
        },
        saveCell: function(d, f) {
            return this.each(function() {
                var a = this,
                c;
                if (! (!a.grid || a.p.cellEdit !== true)) {
                    c = a.p.savedRow.length >= 1 ? 0 : null;
                    if (c !== null) {
                        var h = b("td:eq(" + f + ")", a.rows[d]),
                        e,
                        g,
                        i = a.p.colModel[f],
                        k = i.name,
                        j = b.jgrid.jqID(k);
                        switch (i.edittype) {
                        case "select":
                            if (i.editoptions.multiple) {
                                j = b("#" + d + "_" + j, a.rows[d]);
                                var m = [];
                                if (e = b(j).val()) e.join(",");
                                else e = "";
                                b("option:selected", j).each(function(o, p) {
                                    m[o] = b(p).text()
                                });
                                g = m.join(",")
                            } else {
                                e = b("#" + d + "_" + j + ">option:selected", a.rows[d]).val();
                                g = b("#" + d + "_" + j + ">option:selected", a.rows[d]).text()
                            }
                            if (i.formatter) g = e;
                            break;
                        case "checkbox":
                            var l = ["Yes", "No"];
                            if (i.editoptions) l = i.editoptions.value.split(":");
                            g = e = b("#" + d + "_" + j, a.rows[d]).is(":checked") ? l[0] : l[1];
                            break;
                        case "password":
                        case "text":
                        case "textarea":
                        case "button":
                            g = e = b("#" + d + "_" + j, a.rows[d]).val();
                            break;
                        case "custom":
                            try {
                                if (i.editoptions && b.isFunction(i.editoptions.custom_value)) {
                                    e = i.editoptions.custom_value.call(a, b(".customelement", h), "get");
                                    if (e === undefined) throw "e2";
                                    else g = e
                                } else throw "e1";
                            } catch(q) {
                                q == "e1" && b.jgrid.info_dialog(jQuery.jgrid.errors.errcap, "function 'custom_value' " + b.jgrid.edit.msg.nodefined, jQuery.jgrid.edit.bClose);
                                q == "e2" ? b.jgrid.info_dialog(jQuery.jgrid.errors.errcap, "function 'custom_value' " + b.jgrid.edit.msg.novalue, jQuery.jgrid.edit.bClose) : b.jgrid.info_dialog(jQuery.jgrid.errors.errcap, q.message, jQuery.jgrid.edit.bClose)
                            }
                        }
                        if (g !== a.p.savedRow[c].v) {
                            if (b.isFunction(a.p.beforeSaveCell)) if (c = a.p.beforeSaveCell.call(a, a.rows[d].id, k, e, d, f)) g = e = c;
                            var r = b.jgrid.checkValues(e, f, a);
                            if (r[0] === true) {
                                c = {};
                                if (b.isFunction(a.p.beforeSubmitCell))(c = a.p.beforeSubmitCell.call(a, a.rows[d].id, k, e, d, f)) || (c = {});
                                b("input.hasDatepicker", h).length > 0 && b("input.hasDatepicker", h).datepicker("hide");
                                if (a.p.cellsubmit == "remote") if (a.p.cellurl) {
                                    var n = {};
                                    if (a.p.autoencode) e = b.jgrid.htmlEncode(e);
                                    n[k] = e;
                                    l = a.p.prmNames;
                                    i = l.id;
                                    j = l.oper;
                                    n[i] = b.jgrid.stripPref(a.p.idPrefix, a.rows[d].id);
                                    n[j] = l.editoper;
                                    n = b.extend(c, n);
                                    b("#lui_" + a.p.id).show();
                                    a.grid.hDiv.loading = true;
                                    b.ajax(b.extend({
                                        url: a.p.cellurl,
                                        data: b.isFunction(a.p.serializeCellData) ? a.p.serializeCellData.call(a, n) : n,
                                        type: "POST",
                                        complete: function(o, p) {
                                            b("#lui_" + a.p.id).hide();
                                            a.grid.hDiv.loading = false;
                                            if (p == "success") if (b.isFunction(a.p.afterSubmitCell)) {
                                                var s = a.p.afterSubmitCell.call(a, o, n.id, k, e, d, f);
                                                if (s[0] === true) {
                                                    b(h).empty();
                                                    b(a).jqGrid("setCell", a.rows[d].id, f, g, false, false, true);
                                                    b(h).addClass("dirty-cell");
                                                    b(a.rows[d]).addClass("edited");
                                                    b.isFunction(a.p.afterSaveCell) && a.p.afterSaveCell.call(a, a.rows[d].id, k, e, d, f);
                                                    a.p.savedRow.splice(0, 1)
                                                } else {
                                                    b.jgrid.info_dialog(b.jgrid.errors.errcap, s[1], b.jgrid.edit.bClose);
                                                    b(a).jqGrid("restoreCell", d, f)
                                                }
                                            } else {
                                                b(h).empty();
                                                b(a).jqGrid("setCell", a.rows[d].id, f, g, false, false, true);
                                                b(h).addClass("dirty-cell");
                                                b(a.rows[d]).addClass("edited");
                                                b.isFunction(a.p.afterSaveCell) && a.p.afterSaveCell.call(a, a.rows[d].id, k, e, d, f);
                                                a.p.savedRow.splice(0, 1)
                                            }
                                        },
                                        error: function(o, p) {
                                            b("#lui_" + a.p.id).hide();
                                            a.grid.hDiv.loading = false;
                                            b.isFunction(a.p.errorCell) ? a.p.errorCell.call(a, o, p) : b.jgrid.info_dialog(b.jgrid.errors.errcap, o.status + " : " + o.statusText + "<br/>" + p, b.jgrid.edit.bClose);
                                            b(a).jqGrid("restoreCell", d, f)
                                        }
                                    },
                                    b.jgrid.ajaxOptions, a.p.ajaxCellOptions || {}))
                                } else try {
                                    b.jgrid.info_dialog(b.jgrid.errors.errcap, b.jgrid.errors.nourl, b.jgrid.edit.bClose);
                                    b(a).jqGrid("restoreCell", d, f)
                                } catch(t) {}
                                if (a.p.cellsubmit == "clientArray") {
                                    b(h).empty();
                                    b(a).jqGrid("setCell", a.rows[d].id, f, g, false, false, true);
                                    b(h).addClass("dirty-cell");
                                    b(a.rows[d]).addClass("edited");
                                    b.isFunction(a.p.afterSaveCell) && a.p.afterSaveCell.call(a, a.rows[d].id, k, e, d, f);
                                    a.p.savedRow.splice(0, 1)
                                }
                            } else try {
                                window.setTimeout(function() {
                                    b.jgrid.info_dialog(b.jgrid.errors.errcap, e + " " + r[1], b.jgrid.edit.bClose)
                                },
                                100);
                                b(a).jqGrid("restoreCell", d, f)
                            } catch(u) {}
                        } else b(a).jqGrid("restoreCell", d, f)
                    }
                    b.browser.opera ? b("#" + a.p.knv).attr("tabindex", "-1").focus() : window.setTimeout(function() {
                        b("#" + a.p.knv).attr("tabindex", "-1").focus()
                    },
                    0)
                }
            })
        },
        restoreCell: function(d, f) {
            return this.each(function() {
                var a = this,
                c;
                if (! (!a.grid || a.p.cellEdit !== true)) {
                    c = a.p.savedRow.length >= 1 ? 0 : null;
                    if (c !== null) {
                        var h = b("td:eq(" + f + ")", a.rows[d]);
                        if (b.isFunction(b.fn.datepicker)) try {
                            b("input.hasDatepicker", h).datepicker("hide")
                        } catch(e) {}
                        b(h).empty().attr("tabindex", "-1");
                        b(a).jqGrid("setCell", a.rows[d].id, f, a.p.savedRow[c].v, false, false, true);
                        b.isFunction(a.p.afterRestoreCell) && a.p.afterRestoreCell.call(a, a.rows[d].id, a.p.savedRow[c].v, d, f);
                        a.p.savedRow.splice(0, 1)
                    }
                    window.setTimeout(function() {
                        b("#" + a.p.knv).attr("tabindex", "-1").focus()
                    },
                    0)
                }
            })
        },
        nextCell: function(d, f) {
            return this.each(function() {
                var a = false;
                if (! (!this.grid || this.p.cellEdit !== true)) {
                    for (var c = f + 1; c < this.p.colModel.length; c++) if (this.p.colModel[c].editable === true) {
                        a = c;
                        break
                    }
                    if (a !== false) b(this).jqGrid("editCell", d, a, true);
                    else this.p.savedRow.length > 0 && b(this).jqGrid("saveCell", d, f)
                }
            })
        },
        prevCell: function(d, f) {
            return this.each(function() {
                var a = false;
                if (! (!this.grid || this.p.cellEdit !== true)) {
                    for (var c = f - 1; c >= 0; c--) if (this.p.colModel[c].editable === true) {
                        a = c;
                        break
                    }
                    if (a !== false) b(this).jqGrid("editCell", d, a, true);
                    else this.p.savedRow.length > 0 && b(this).jqGrid("saveCell", d, f)
                }
            })
        },
        GridNav: function() {
            return this.each(function() {
                function d(g, i, k) {
                    if (k.substr(0, 1) == "v") {
                        var j = b(a.grid.bDiv)[0].clientHeight,
                        m = b(a.grid.bDiv)[0].scrollTop,
                        l = a.rows[g].offsetTop + a.rows[g].clientHeight,
                        q = a.rows[g].offsetTop;
                        if (k == "vd") if (l >= j) b(a.grid.bDiv)[0].scrollTop = b(a.grid.bDiv)[0].scrollTop + a.rows[g].clientHeight;
                        if (k == "vu") if (q < m) b(a.grid.bDiv)[0].scrollTop = b(a.grid.bDiv)[0].scrollTop - a.rows[g].clientHeight
                    }
                    if (k == "h") {
                        k = b(a.grid.bDiv)[0].clientWidth;
                        j = b(a.grid.bDiv)[0].scrollLeft;
                        m = a.rows[g].cells[i].offsetLeft;
                        if (a.rows[g].cells[i].offsetLeft + a.rows[g].cells[i].clientWidth >= k + parseInt(j, 10)) b(a.grid.bDiv)[0].scrollLeft = b(a.grid.bDiv)[0].scrollLeft + a.rows[g].cells[i].clientWidth;
                        else if (m < j) b(a.grid.bDiv)[0].scrollLeft = b(a.grid.bDiv)[0].scrollLeft - a.rows[g].cells[i].clientWidth
                    }
                }
                function f(g, i) {
                    var k, j;
                    if (i == "lft") {
                        k = g + 1;
                        for (j = g; j >= 0; j--) if (a.p.colModel[j].hidden !== true) {
                            k = j;
                            break
                        }
                    }
                    if (i == "rgt") {
                        k = g - 1;
                        for (j = g; j < a.p.colModel.length; j++) if (a.p.colModel[j].hidden !== true) {
                            k = j;
                            break
                        }
                    }
                    return k
                }
                var a = this;
                if (! (!a.grid || a.p.cellEdit !== true)) {
                    a.p.knv = a.p.id + "_kn";
                    var c = b("<span style='width:0px;height:0px;background-color:black;' tabindex='0'><span tabindex='-1' style='width:0px;height:0px;background-color:grey' id='" + a.p.knv + "'></span></span>"),
                    h,
                    e;
                    b(c).insertBefore(a.grid.cDiv);
                    b("#" + a.p.knv).focus().keydown(function(g) {
                        e = g.keyCode;
                        if (a.p.direction == "rtl") if (e == 37) e = 39;
                        else if (e == 39) e = 37;
                        switch (e) {
                        case 38:
                            if (a.p.iRow - 1 > 0) {
                                d(a.p.iRow - 1, a.p.iCol, "vu");
                                b(a).jqGrid("editCell", a.p.iRow - 1, a.p.iCol, false)
                            }
                            break;
                        case 40:
                            if (a.p.iRow + 1 <= a.rows.length - 1) {
                                d(a.p.iRow + 1, a.p.iCol, "vd");
                                b(a).jqGrid("editCell", a.p.iRow + 1, a.p.iCol, false)
                            }
                            break;
                        case 37:
                            if (a.p.iCol - 1 >= 0) {
                                h = f(a.p.iCol - 1, "lft");
                                d(a.p.iRow, h, "h");
                                b(a).jqGrid("editCell", a.p.iRow, h, false)
                            }
                            break;
                        case 39:
                            if (a.p.iCol + 1 <= a.p.colModel.length - 1) {
                                h = f(a.p.iCol + 1, "rgt");
                                d(a.p.iRow, h, "h");
                                b(a).jqGrid("editCell", a.p.iRow, h, false)
                            }
                            break;
                        case 13:
                            parseInt(a.p.iCol, 10) >= 0 && parseInt(a.p.iRow, 10) >= 0 && b(a).jqGrid("editCell", a.p.iRow, a.p.iCol, true);
                            break;
                        default:
                            return true
                        }
                        return false
                    })
                }
            })
        },
        getChangedCells: function(d) {
            var f = [];
            d || (d = "all");
            this.each(function() {
                var a = this,
                c; ! a.grid || a.p.cellEdit !== true || b(a.rows).each(function(h) {
                    var e = {};
                    if (b(this).hasClass("edited")) {
                        b("td", this).each(function(g) {
                            c = a.p.colModel[g].name;
                            if (c !== "cb" && c !== "subgrid") if (d == "dirty") {
                                if (b(this).hasClass("dirty-cell")) try {
                                    e[c] = b.unformat(this, {
                                        rowId: a.rows[h].id,
                                        colModel: a.p.colModel[g]
                                    },
                                    g)
                                } catch(i) {
                                    e[c] = b.jgrid.htmlDecode(b(this).html())
                                }
                            } else try {
                                e[c] = b.unformat(this, {
                                    rowId: a.rows[h].id,
                                    colModel: a.p.colModel[g]
                                },
                                g)
                            } catch(k) {
                                e[c] = b.jgrid.htmlDecode(b(this).html())
                            }
                        });
                        e.id = this.id;
                        f.push(e)
                    }
                })
            });
            return f
        }
    })
})(jQuery); (function(b) {
    b.fn.jqm = function(a) {
        var f = {
            overlay: 50,
            closeoverlay: true,
            overlayClass: "jqmOverlay",
            closeClass: "jqmClose",
            trigger: ".jqModal",
            ajax: e,
            ajaxText: "",
            target: e,
            modal: e,
            toTop: e,
            onShow: e,
            onHide: e,
            onLoad: e
        };
        return this.each(function() {
            if (this._jqm) return j[this._jqm].c = b.extend({},
            j[this._jqm].c, a);
            l++;
            this._jqm = l;
            j[l] = {
                c: b.extend(f, b.jqm.params, a),
                a: e,
                w: b(this).addClass("jqmID" + l),
                s: l
            };
            f.trigger && b(this).jqmAddTrigger(f.trigger)
        })
    };
    b.fn.jqmAddClose = function(a) {
        return o(this, a, "jqmHide")
    };
    b.fn.jqmAddTrigger = function(a) {
        return o(this, a, "jqmShow")
    };
    b.fn.jqmShow = function(a) {
        return this.each(function() {
            b.jqm.open(this._jqm, a)
        })
    };
    b.fn.jqmHide = function(a) {
        return this.each(function() {
            b.jqm.close(this._jqm, a)
        })
    };
    b.jqm = {
        hash: {},
        open: function(a, f) {
            var c = j[a],
            d = c.c,
            i = "." + d.closeClass,
            g = parseInt(c.w.css("z-index"));
            g = g > 0 ? g: 3E3;
            var h = b("<div></div>").css({
                height: "100%",
                width: "100%",
                position: "fixed",
                left: 0,
                top: 0,
                "z-index": g - 1,
                opacity: d.overlay / 100
            });
            if (c.a) return e;
            c.t = f;
            c.a = true;
            c.w.css("z-index", g);
            if (d.modal) {
                k[0] || setTimeout(function() {
                    p("bind")
                },
                1);
                k.push(a)
            } else if (d.overlay > 0) d.closeoverlay && c.w.jqmAddClose(h);
            else h = e;
            c.o = h ? h.addClass(d.overlayClass).prependTo("body") : e;
            if (q) {
                b("html,body").css({
                    height: "100%",
                    width: "100%"
                });
                if (h) {
                    h = h.css({
                        position: "absolute"
                    })[0];
                    for (var m in {
                        Top: 1,
                        Left: 1
                    }) h.style.setExpression(m.toLowerCase(), "(_=(document.documentElement.scroll" + m + " || document.body.scroll" + m + "))+'px'")
                }
            }
            if (d.ajax) {
                g = d.target || c.w;
                h = d.ajax;
                g = typeof g == "string" ? b(g, c.w) : b(g);
                h = h.substr(0, 1) == "@" ? b(f).attr(h.substring(1)) : h;
                g.html(d.ajaxText).load(h,
                function() {
                    d.onLoad && d.onLoad.call(this, c);
                    i && c.w.jqmAddClose(b(i, c.w));
                    r(c)
                })
            } else i && c.w.jqmAddClose(b(i, c.w));
            d.toTop && c.o && c.w.before('<span id="jqmP' + c.w[0]._jqm + '"></span>').insertAfter(c.o);
            d.onShow ? d.onShow(c) : c.w.show();
            r(c);
            return e
        },
        close: function(a) {
            a = j[a];
            if (!a.a) return e;
            a.a = e;
            if (k[0]) {
                k.pop();
                k[0] || p("unbind")
            }
            a.c.toTop && a.o && b("#jqmP" + a.w[0]._jqm).after(a.w).remove();
            if (a.c.onHide) a.c.onHide(a);
            else {
                a.w.hide();
                a.o && a.o.remove()
            }
            return e
        },
        params: {}
    };
    var l = 0,
    j = b.jqm.hash,
    k = [],
    q = b.browser.msie && b.browser.version == "6.0",
    e = false,
    r = function(a) {
        var f = b('<iframe src="javascript:false;document.write(\'\');" class="jqm"></iframe>').css({
            opacity: 0
        });
        if (q) if (a.o) a.o.html('<p style="width:100%;height:100%"/>').prepend(f);
        else b("iframe.jqm", a.w)[0] || a.w.prepend(f);
        s(a)
    },
    s = function(a) {
        try {
            b(":input:visible", a.w)[0].focus()
        } catch(f) {}
    },
    p = function(a) {
        b(document)[a]("keypress", n)[a]("keydown", n)[a]("mousedown", n)
    },
    n = function(a) {
        var f = j[k[k.length - 1]]; (a = !b(a.target).parents(".jqmID" + f.s)[0]) && s(f);
        return ! a
    },
    o = function(a, f, c) {
        return a.each(function() {
            var d = this._jqm;
            b(f).each(function() {
                if (!this[c]) {
                    this[c] = [];
                    b(this).click(function() {
                        for (var i in {
                            jqmShow: 1,
                            jqmHide: 1
                        }) for (var g in this[i]) if (j[this[i][g]]) j[this[i][g]].w[i](this);
                        return e
                    })
                }
                this[c].push(d)
            })
        })
    }
})(jQuery); (function(b) {
    b.fn.jqDrag = function(a) {
        return l(this, a, "d")
    };
    b.fn.jqResize = function(a, e) {
        return l(this, a, "r", e)
    };
    b.jqDnR = {
        dnr: {},
        e: 0,
        drag: function(a) {
            if (c.k == "d") d.css({
                left: c.X + a.pageX - c.pX,
                top: c.Y + a.pageY - c.pY
            });
            else {
                d.css({
                    width: Math.max(a.pageX - c.pX + c.W, 0),
                    height: Math.max(a.pageY - c.pY + c.H, 0)
                });
                M1 && f.css({
                    width: Math.max(a.pageX - M1.pX + M1.W, 0),
                    height: Math.max(a.pageY - M1.pY + M1.H, 0)
                })
            }
            return false
        },
        stop: function() {
            b(document).unbind("mousemove", i.drag).unbind("mouseup", i.stop)
        }
    };
    var i = b.jqDnR,
    c = i.dnr,
    d = i.e,
    f, l = function(a, e, n, m) {
        return a.each(function() {
            e = e ? b(e, a) : a;
            e.bind("mousedown", {
                e: a,
                k: n
            },
            function(g) {
                var j = g.data,
                h = {};
                d = j.e;
                f = m ? b(m) : false;
                if (d.css("position") != "relative") try {
                    d.position(h)
                } catch(o) {}
                c = {
                    X: h.left || k("left") || 0,
                    Y: h.top || k("top") || 0,
                    W: k("width") || d[0].scrollWidth || 0,
                    H: k("height") || d[0].scrollHeight || 0,
                    pX: g.pageX,
                    pY: g.pageY,
                    k: j.k
                };
                M1 = f && j.k != "d" ? {
                    X: h.left || f1("left") || 0,
                    Y: h.top || f1("top") || 0,
                    W: f[0].offsetWidth || f1("width") || 0,
                    H: f[0].offsetHeight || f1("height") || 0,
                    pX: g.pageX,
                    pY: g.pageY,
                    k: j.k
                }: false;
                if (b("input.hasDatepicker", d[0])[0]) try {
                    b("input.hasDatepicker", d[0]).datepicker("hide")
                } catch(p) {}
                b(document).mousemove(b.jqDnR.drag).mouseup(b.jqDnR.stop);
                return false
            })
        })
    },
    k = function(a) {
        return parseInt(d.css(a)) || false
    };
    f1 = function(a) {
        return parseInt(f.css(a)) || false
    }
})(jQuery); (function(b) {
    b.jgrid.extend({
        setSubGrid: function() {
            return this.each(function() {
                var f;
                this.p.subGridOptions = b.extend({
                    plusicon: "ui-icon-plus",
                    minusicon: "ui-icon-minus",
                    openicon: "ui-icon-carat-1-sw",
                    expandOnLoad: false,
                    delayOnLoad: 50,
                    selectOnExpand: false,
                    reloadOnExpand: true
                },
                this.p.subGridOptions || {});
                this.p.colNames.unshift("");
                this.p.colModel.unshift({
                    name: "subgrid",
                    width: b.browser.safari ? this.p.subGridWidth + this.p.cellLayout: this.p.subGridWidth,
                    sortable: false,
                    resizable: false,
                    hidedlg: true,
                    search: false,
                    fixed: true
                });
                f = this.p.subGridModel;
                if (f[0]) {
                    f[0].align = b.extend([], f[0].align || []);
                    for (var d = 0; d < f[0].name.length; d++) f[0].align[d] = f[0].align[d] || "left"
                }
            })
        },
        addSubGridCell: function(f, d) {
            var a = "",
            n, s;
            this.each(function() {
                a = this.formatCol(f, d);
                s = this.p.id;
                n = this.p.subGridOptions.plusicon
            });
            return '<td role="gridcell" aria-describedby="' + s + '_subgrid" class="ui-sgcollapsed sgcollapsed" ' + a + "><a href='javascript:void(0);'><span class='ui-icon " + n + "'></span></a></td>"
        },
        addSubGrid: function(f, d) {
            return this.each(function() {
                var a = this;
                if (a.grid) {
                    var n = function(g, j, e) {
                        j = b("<td align='" + a.p.subGridModel[0].align[e] + "'></td>").html(j);
                        b(g).append(j)
                    },
                    s = function(g, j) {
                        var e, c, h, k = b("<table cellspacing='0' cellpadding='0' border='0'><tbody></tbody></table>"),
                        i = b("<tr></tr>");
                        for (c = 0; c < a.p.subGridModel[0].name.length; c++) {
                            e = b("<th class='ui-state-default ui-th-subgrid ui-th-column ui-th-" + a.p.direction + "'></th>");
                            b(e).html(a.p.subGridModel[0].name[c]);
                            b(e).width(a.p.subGridModel[0].width[c]);
                            b(i).append(e)
                        }
                        b(k).append(i);
                        if (g) {
                            h = a.p.xmlReader.subgrid;
                            b(h.root + " " + h.row, g).each(function() {
                                i = b("<tr class='ui-widget-content ui-subtblcell'></tr>");
                                if (h.repeatitems === true) b(h.cell, this).each(function(m) {
                                    n(i, b(this).text() || "&#160;", m)
                                });
                                else {
                                    var o = a.p.subGridModel[0].mapping || a.p.subGridModel[0].name;
                                    if (o) for (c = 0; c < o.length; c++) n(i, b(o[c], this).text() || "&#160;", c)
                                }
                                b(k).append(i)
                            })
                        }
                        e = b("table:first", a.grid.bDiv).attr("id") + "_";
                        b("#" + e + j).append(k);
                        a.grid.hDiv.loading = false;
                        b("#load_" + a.p.id).hide();
                        return false
                    },
                    v = function(g, j) {
                        var e, c, h, k, i, o = b("<table cellspacing='0' cellpadding='0' border='0'><tbody></tbody></table>"),
                        m = b("<tr></tr>");
                        for (c = 0; c < a.p.subGridModel[0].name.length; c++) {
                            e = b("<th class='ui-state-default ui-th-subgrid ui-th-column ui-th-" + a.p.direction + "'></th>");
                            b(e).html(a.p.subGridModel[0].name[c]);
                            b(e).width(a.p.subGridModel[0].width[c]);
                            b(m).append(e)
                        }
                        b(o).append(m);
                        if (g) {
                            k = a.p.jsonReader.subgrid;
                            e = g[k.root];
                            if (typeof e !== "undefined") for (c = 0; c < e.length; c++) {
                                h = e[c];
                                m = b("<tr class='ui-widget-content ui-subtblcell'></tr>");
                                if (k.repeatitems === true) {
                                    if (k.cell) h = h[k.cell];
                                    for (i = 0; i < h.length; i++) n(m, h[i] || "&#160;", i)
                                } else {
                                    var u = a.p.subGridModel[0].mapping || a.p.subGridModel[0].name;
                                    if (u.length) for (i = 0; i < u.length; i++) n(m, h[u[i]] || "&#160;", i)
                                }
                                b(o).append(m)
                            }
                        }
                        c = b("table:first", a.grid.bDiv).attr("id") + "_";
                        b("#" + c + j).append(o);
                        a.grid.hDiv.loading = false;
                        b("#load_" + a.p.id).hide();
                        return false
                    },
                    z = function(g) {
                        var j, e, c, h;
                        j = b(g).attr("id");
                        e = {
                            nd_: (new Date).getTime()
                        };
                        e[a.p.prmNames.subgridid] = j;
                        if (!a.p.subGridModel[0]) return false;
                        if (a.p.subGridModel[0].params) for (h = 0; h < a.p.subGridModel[0].params.length; h++) for (c = 0; c < a.p.colModel.length; c++) if (a.p.colModel[c].name == a.p.subGridModel[0].params[h]) e[a.p.colModel[c].name] = b("td:eq(" + c + ")", g).text().replace(/\&#160\;/ig, "");
                        if (!a.grid.hDiv.loading) {
                            a.grid.hDiv.loading = true;
                            b("#load_" + a.p.id).show();
                            if (!a.p.subgridtype) a.p.subgridtype = a.p.datatype;
                            if (b.isFunction(a.p.subgridtype)) a.p.subgridtype.call(a, e);
                            else a.p.subgridtype = a.p.subgridtype.toLowerCase();
                            switch (a.p.subgridtype) {
                            case "xml":
                            case "json":
                                b.ajax(b.extend({
                                    type:
                                    a.p.mtype,
                                    url: a.p.subGridUrl,
                                    dataType: a.p.subgridtype,
                                    data: b.isFunction(a.p.serializeSubGridData) ? a.p.serializeSubGridData.call(a, e) : e,
                                    complete: function(k) {
                                        a.p.subgridtype == "xml" ? s(k.responseXML, j) : v(b.jgrid.parse(k.responseText), j)
                                    }
                                },
                                b.jgrid.ajaxOptions, a.p.ajaxSubgridOptions || {}))
                            }
                        }
                        return false
                    },
                    l,
                    t,
                    w,
                    x = 0,
                    p,
                    q;
                    b.each(a.p.colModel,
                    function() {
                        if (this.hidden === true || this.name == "rn" || this.name == "cb") x++
                    });
                    var y = a.rows.length,
                    r = 1;
                    if (d !== undefined && d > 0) {
                        r = d;
                        y = d + 1
                    }
                    for (; r < y;) {
                        b(a.rows[r]).hasClass("jqgrow") && b(a.rows[r].cells[f]).bind("click",
                        function() {
                            var g = b(this).parent("tr")[0];
                            q = g.nextSibling;
                            if (b(this).hasClass("sgcollapsed")) {
                                t = a.p.id;
                                l = g.id;
                                if (a.p.subGridOptions.reloadOnExpand === true || a.p.subGridOptions.reloadOnExpand === false && !b(q).hasClass("ui-subgrid")) {
                                    w = f >= 1 ? "<td colspan='" + f + "'>&#160;</td>": "";
                                    p = true;
                                    if (b.isFunction(a.p.subGridBeforeExpand)) p = a.p.subGridBeforeExpand.call(a, t + "_" + l, l);
                                    if (p === false) return false;
                                    b(g).after("<tr role='row' class='ui-subgrid'>" + w + "<td class='ui-widget-content subgrid-cell'><span class='ui-icon " + a.p.subGridOptions.openicon + "'></span></td><td colspan='" + parseInt(a.p.colNames.length - 1 - x, 10) + "' class='ui-widget-content subgrid-data'><div id=" + t + "_" + l + " class='tablediv'></div></td></tr>");
                                    b.isFunction(a.p.subGridRowExpanded) ? a.p.subGridRowExpanded.call(a, t + "_" + l, l) : z(g)
                                } else b(q).show();
                                b(this).html("<a href='javascript:void(0);'><span class='ui-icon " + a.p.subGridOptions.minusicon + "'></span></a>").removeClass("sgcollapsed").addClass("sgexpanded");
                                a.p.subGridOptions.selectOnExpand && b(a).jqGrid("setSelection", l)
                            } else if (b(this).hasClass("sgexpanded")) {
                                p = true;
                                if (b.isFunction(a.p.subGridRowColapsed)) {
                                    l = g.id;
                                    p = a.p.subGridRowColapsed.call(a, t + "_" + l, l)
                                }
                                if (p === false) return false;
                                if (a.p.subGridOptions.reloadOnExpand === true) b(q).remove(".ui-subgrid");
                                else b(q).hasClass("ui-subgrid") && b(q).hide();
                                b(this).html("<a href='javascript:void(0);'><span class='ui-icon " + a.p.subGridOptions.plusicon + "'></span></a>").removeClass("sgexpanded").addClass("sgcollapsed")
                            }
                            return false
                        });
                        a.p.subGridOptions.expandOnLoad === true && b(a.rows[r].cells[f]).trigger("click");
                        r++
                    }
                    a.subGridXml = function(g, j) {
                        s(g, j)
                    };
                    a.subGridJson = function(g, j) {
                        v(g, j)
                    }
                }
            })
        },
        expandSubGridRow: function(f) {
            return this.each(function() {
                if (this.grid || f) if (this.p.subGrid === true) {
                    var d = b(this).jqGrid("getInd", f, true);
                    if (d)(d = b("td.sgcollapsed", d)[0]) && b(d).trigger("click")
                }
            })
        },
        collapseSubGridRow: function(f) {
            return this.each(function() {
                if (this.grid || f) if (this.p.subGrid === true) {
                    var d = b(this).jqGrid("getInd", f, true);
                    if (d)(d = b("td.sgexpanded", d)[0]) && b(d).trigger("click")
                }
            })
        },
        toggleSubGridRow: function(f) {
            return this.each(function() {
                if (this.grid || f) if (this.p.subGrid === true) {
                    var d = b(this).jqGrid("getInd", f, true);
                    if (d) {
                        var a = b("td.sgcollapsed", d)[0];
                        if (a) b(a).trigger("click");
                        else(a = b("td.sgexpanded", d)[0]) && b(a).trigger("click")
                    }
                }
            })
        }
    })
})(jQuery); (function(e) {
    e.jgrid.extend({
        groupingSetup: function() {
            return this.each(function() {
                var a = this.p.groupingView;
                if (a !== null && (typeof a === "object" || e.isFunction(a))) if (a.groupField.length) {
                    if (typeof a.visibiltyOnNextGrouping == "undefined") a.visibiltyOnNextGrouping = [];
                    for (var c = 0; c < a.groupField.length; c++) {
                        a.groupOrder[c] || (a.groupOrder[c] = "asc");
                        a.groupText[c] || (a.groupText[c] = "{0}");
                        if (typeof a.groupColumnShow[c] != "boolean") a.groupColumnShow[c] = true;
                        if (typeof a.groupSummary[c] != "boolean") a.groupSummary[c] = false;
                        if (a.groupColumnShow[c] === true) {
                            a.visibiltyOnNextGrouping[c] = true;
                            e(this).jqGrid("showCol", a.groupField[c])
                        } else {
                            a.visibiltyOnNextGrouping[c] = e("#" + this.p.id + "_" + a.groupField[c]).is(":visible");
                            e(this).jqGrid("hideCol", a.groupField[c])
                        }
                        a.sortitems[c] = [];
                        a.sortnames[c] = [];
                        a.summaryval[c] = [];
                        if (a.groupSummary[c]) {
                            a.summary[c] = [];
                            for (var b = this.p.colModel,
                            d = 0,
                            g = b.length; d < g; d++) b[d].summaryType && a.summary[c].push({
                                nm: b[d].name,
                                st: b[d].summaryType,
                                v: ""
                            })
                        }
                    }
                    this.p.scroll = false;
                    this.p.rownumbers = false;
                    this.p.subGrid = false;
                    this.p.treeGrid = false;
                    this.p.gridview = true
                } else this.p.grouping = false;
                else this.p.grouping = false
            })
        },
        groupingPrepare: function(a, c, b, d) {
            this.each(function() {
                c[0] += "";
                var g = c[0].toString().split(" ").join(""),
                h = this.p.groupingView,
                f = this;
                if (b.hasOwnProperty(g)) b[g].push(a);
                else {
                    b[g] = [];
                    b[g].push(a);
                    h.sortitems[0].push(g);
                    h.sortnames[0].push(e.trim(c[0].toString()));
                    h.summaryval[0][g] = e.extend(true, [], h.summary[0])
                }
                h.groupSummary[0] && e.each(h.summaryval[0][g],
                function() {
                    this.v = e.isFunction(this.st) ? this.st.call(f, this.v, this.nm, d) : e(f).jqGrid("groupingCalculations." + this.st, this.v, this.nm, d)
                })
            });
            return b
        },
        groupingToggle: function(a) {
            this.each(function() {
                var c = this.p.groupingView,
                b = a.lastIndexOf("_"),
                d = a.substring(0, b + 1);
                b = parseInt(a.substring(b + 1), 10) + 1;
                var g = c.minusicon,
                h = c.plusicon,
                f = e("#" + a);
                f = f.length ? f[0].nextSibling: null;
                var k = e("#" + a + " span.tree-wrap-" + this.p.direction),
                l = false;
                if (k.hasClass(g)) {
                    if (c.showSummaryOnHide && c.groupSummary[0]) {
                        if (f) for (; f;) {
                            if (e(f).hasClass("jqfoot")) break;
                            e(f).hide();
                            f = f.nextSibling
                        }
                    } else if (f) for (; f;) {
                        if (e(f).attr("id") == d + String(b)) break;
                        e(f).hide();
                        f = f.nextSibling
                    }
                    k.removeClass(g).addClass(h);
                    l = true
                } else {
                    if (f) for (; f;) {
                        if (e(f).attr("id") == d + String(b)) break;
                        e(f).show();
                        f = f.nextSibling
                    }
                    k.removeClass(h).addClass(g)
                }
                e.isFunction(this.p.onClickGroup) && this.p.onClickGroup.call(this, a, l)
            });
            return false
        },
        groupingRender: function(a, c) {
            return this.each(function() {
                var b = this,
                d = b.p.groupingView,
                g = "",
                h = "",
                f, k = d.groupCollapse ? d.plusicon: d.minusicon,
                l,
                r,
                m;
                if (!d.groupDataSorted) {
                    d.sortitems[0].sort();
                    d.sortnames[0].sort();
                    if (d.groupOrder[0].toLowerCase() == "desc") {
                        d.sortitems[0].reverse();
                        d.sortnames[0].reverse()
                    }
                }
                k += " tree-wrap-" + b.p.direction;
                for (m = 0; m < c;) {
                    if (b.p.colModel[m].name == d.groupField[0]) {
                        r = m;
                        break
                    }
                    m++
                }
                e.each(d.sortitems[0],
                function(o, n) {
                    f = b.p.id + "ghead_" + o;
                    h = "<span style='cursor:pointer;' class='ui-icon " + k + "' onclick=\"jQuery('#" + b.p.id + "').jqGrid('groupingToggle','" + f + "');return false;\"></span>";
                    try {
                        l = b.formatter(f, d.sortnames[0][o], r, d.sortitems[0])
                    } catch(v) {
                        l = d.sortnames[0][o]
                    }
                    g += '<tr id="' + f + '" role="row" class= "ui-widget-content jqgroup ui-row-' + b.p.direction + '"><td colspan="' + c + '">' + h + e.jgrid.format(d.groupText[0], l, a[n].length) + "</td></tr>";
                    for (var i = 0; i < a[n].length; i++) g += a[n][i].join("");
                    if (d.groupSummary[0]) {
                        i = "";
                        if (d.groupCollapse && !d.showSummaryOnHide) i = ' style="display:none;"';
                        g += "<tr" + i + ' role="row" class="ui-widget-content jqfoot ui-row-' + b.p.direction + '">';
                        i = d.summaryval[0][n];
                        for (var p = b.p.colModel,
                        q, s = a[n].length, j = 0; j < c; j++) {
                            var t = "<td " + b.formatCol(j, 1, "") + ">&#160;</td>",
                            u = "{0}";
                            e.each(i,
                            function() {
                                if (this.nm == p[j].name) {
                                    if (p[j].summaryTpl) u = p[j].summaryTpl;
                                    if (this.st == "avg") if (this.v && s > 0) this.v /= s;
                                    try {
                                        q = b.formatter("", this.v, j, this)
                                    } catch(w) {
                                        q = this.v
                                    }
                                    t = "<td " + b.formatCol(j, 1, "") + ">" + e.jgrid.format(u, q) + "</td>";
                                    return false
                                }
                            });
                            g += t
                        }
                        g += "</tr>"
                    }
                });
                e("#" + b.p.id + " tbody:first").append(g);
                g = null
            })
        },
        groupingGroupBy: function(a, c) {
            return this.each(function() {
                if (typeof a == "string") a = [a];
                var b = this.p.groupingView;
                this.p.grouping = true;
                if (typeof b.visibiltyOnNextGrouping == "undefined") b.visibiltyOnNextGrouping = [];
                var d;
                for (d = 0; d < b.groupField.length; d++) ! b.groupColumnShow[d] && b.visibiltyOnNextGrouping[d] && e(this).jqGrid("showCol", b.groupField[d]);
                for (d = 0; d < a.length; d++) b.visibiltyOnNextGrouping[d] = e("#" + this.p.id + "_" + a[d]).is(":visible");
                this.p.groupingView = e.extend(this.p.groupingView, c || {});
                b.groupField = a;
                e(this).trigger("reloadGrid")
            })
        },
        groupingRemove: function(a) {
            return this.each(function() {
                if (typeof a == "undefined") a = true;
                this.p.grouping = false;
                if (a === true) {
                    for (var c = this.p.groupingView,
                    b = 0; b < c.groupField.length; b++) ! c.groupColumnShow[b] && c.visibiltyOnNextGrouping[b] && e(this).jqGrid("showCol", c.groupField);
                    e("tr.jqgroup, tr.jqfoot", "#" + this.p.id + " tbody:first").remove();
                    e("tr.jqgrow:hidden", "#" + this.p.id + " tbody:first").show()
                } else e(this).trigger("reloadGrid")
            })
        },
        groupingCalculations: {
            sum: function(a, c, b) {
                return parseFloat(a || 0) + parseFloat(b[c] || 0)
            },
            min: function(a, c, b) {
                if (a === "") return parseFloat(b[c] || 0);
                return Math.min(parseFloat(a), parseFloat(b[c] || 0))
            },
            max: function(a, c, b) {
                if (a === "") return parseFloat(b[c] || 0);
                return Math.max(parseFloat(a), parseFloat(b[c] || 0))
            },
            count: function(a, c, b) {
                if (a === "") a = 0;
                return b.hasOwnProperty(c) ? a + 1 : 0
            },
            avg: function(a, c, b) {
                return parseFloat(a || 0) + parseFloat(b[c] || 0)
            }
        }
    })
})(jQuery); (function(d) {
    d.jgrid.extend({
        setTreeNode: function(a, c) {
            return this.each(function() {
                var b = this;
                if (b.grid && b.p.treeGrid) for (var e = b.p.expColInd,
                g = b.p.treeReader.expanded_field,
                h = b.p.treeReader.leaf_field,
                f = b.p.treeReader.level_field,
                l = b.p.treeReader.icon_field,
                i = b.p.treeReader.loaded,
                j, o, n, k; a < c;) {
                    k = b.p.data[b.p._index[b.rows[a].id]];
                    if (b.p.treeGridModel == "nested") if (!k[h]) {
                        j = parseInt(k[b.p.treeReader.left_field], 10);
                        o = parseInt(k[b.p.treeReader.right_field], 10);
                        k[h] = o === j + 1 ? "true": "false";
                        b.rows[a].cells[b.p._treeleafpos].innerHTML = k[h]
                    }
                    j = parseInt(k[f], 10);
                    if (b.p.tree_root_level === 0) {
                        n = j + 1;
                        o = j
                    } else {
                        n = j;
                        o = j - 1
                    }
                    n = "<div class='tree-wrap tree-wrap-" + b.p.direction + "' style='width:" + n * 18 + "px;'>";
                    n += "<div style='" + (b.p.direction == "rtl" ? "right:": "left:") + o * 18 + "px;' class='ui-icon ";
                    if (k[i] !== undefined) k[i] = k[i] == "true" || k[i] === true ? true: false;
                    if (k[h] == "true" || k[h] === true) {
                        n += (k[l] !== undefined && k[l] !== "" ? k[l] : b.p.treeIcons.leaf) + " tree-leaf treeclick";
                        k[h] = true;
                        o = "leaf"
                    } else {
                        k[h] = false;
                        o = ""
                    }
                    k[g] = (k[g] == "true" || k[g] === true ? true: false) && k[i];
                    n += k[g] === false ? k[h] === true ? "'": b.p.treeIcons.plus + " tree-plus treeclick'": k[h] === true ? "'": b.p.treeIcons.minus + " tree-minus treeclick'";
                    n += "></div></div>";
                    d(b.rows[a].cells[e]).wrapInner("<span class='cell-wrapper" + o + "'></span>").prepend(n);
                    if (j !== parseInt(b.p.tree_root_level, 10))(k = (k = d(b).jqGrid("getNodeParent", k)) && k.hasOwnProperty(g) ? k[g] : true) || d(b.rows[a]).css("display", "none");
                    d(b.rows[a].cells[e]).find("div.treeclick").bind("click",
                    function(m) {
                        m = d(m.target || m.srcElement, b.rows).closest("tr.jqgrow")[0].id;
                        m = b.p._index[m];
                        if (!b.p.data[m][h]) if (b.p.data[m][g]) {
                            d(b).jqGrid("collapseRow", b.p.data[m]);
                            d(b).jqGrid("collapseNode", b.p.data[m])
                        } else {
                            d(b).jqGrid("expandRow", b.p.data[m]);
                            d(b).jqGrid("expandNode", b.p.data[m])
                        }
                        return false
                    });
                    b.p.ExpandColClick === true && d(b.rows[a].cells[e]).find("span.cell-wrapper").css("cursor", "pointer").bind("click",
                    function(m) {
                        m = d(m.target || m.srcElement, b.rows).closest("tr.jqgrow")[0].id;
                        var r = b.p._index[m];
                        if (!b.p.data[r][h]) if (b.p.data[r][g]) {
                            d(b).jqGrid("collapseRow", b.p.data[r]);
                            d(b).jqGrid("collapseNode", b.p.data[r])
                        } else {
                            d(b).jqGrid("expandRow", b.p.data[r]);
                            d(b).jqGrid("expandNode", b.p.data[r])
                        }
                        d(b).jqGrid("setSelection", m);
                        return false
                    });
                    a++
                }
            })
        },
        setTreeGrid: function() {
            return this.each(function() {
                var a = this,
                c = 0,
                b = false,
                e, g, h = [];
                if (a.p.treeGrid) {
                    a.p.treedatatype || d.extend(a.p, {
                        treedatatype: a.p.datatype
                    });
                    a.p.subGrid = false;
                    a.p.altRows = false;
                    a.p.pgbuttons = false;
                    a.p.pginput = false;
                    a.p.gridview = true;
                    if (a.p.rowTotal === null) a.p.rowNum = 1E4;
                    a.p.multiselect = false;
                    a.p.rowList = [];
                    a.p.expColInd = 0;
                    a.p.treeIcons = d.extend({
                        plus: "ui-icon-triangle-1-" + (a.p.direction == "rtl" ? "w": "e"),
                        minus: "ui-icon-triangle-1-s",
                        leaf: "ui-icon-radio-off"
                    },
                    a.p.treeIcons || {});
                    if (a.p.treeGridModel == "nested") a.p.treeReader = d.extend({
                        level_field: "level",
                        left_field: "lft",
                        right_field: "rgt",
                        leaf_field: "isLeaf",
                        expanded_field: "expanded",
                        loaded: "loaded",
                        icon_field: "icon"
                    },
                    a.p.treeReader);
                    else if (a.p.treeGridModel == "adjacency") a.p.treeReader = d.extend({
                        level_field: "level",
                        parent_id_field: "parent",
                        leaf_field: "isLeaf",
                        expanded_field: "expanded",
                        loaded: "loaded",
                        icon_field: "icon"
                    },
                    a.p.treeReader);
                    for (g in a.p.colModel) if (a.p.colModel.hasOwnProperty(g)) {
                        e = a.p.colModel[g].name;
                        if (e == a.p.ExpandColumn && !b) {
                            b = true;
                            a.p.expColInd = c
                        }
                        c++;
                        for (var f in a.p.treeReader) a.p.treeReader[f] == e && h.push(e)
                    }
                    d.each(a.p.treeReader,
                    function(l, i) {
                        if (i && d.inArray(i, h) === -1) {
                            if (l === "leaf_field") a.p._treeleafpos = c;
                            c++;
                            a.p.colNames.push(i);
                            a.p.colModel.push({
                                name: i,
                                width: 1,
                                hidden: true,
                                sortable: false,
                                resizable: false,
                                hidedlg: true,
                                editable: true,
                                search: false
                            })
                        }
                    })
                }
            })
        },
        expandRow: function(a) {
            this.each(function() {
                var c = this;
                if (c.grid && c.p.treeGrid) {
                    var b = d(c).jqGrid("getNodeChildren", a),
                    e = c.p.treeReader.expanded_field;
                    d(b).each(function() {
                        var g = d.jgrid.getAccessor(this, c.p.localReader.id);
                        d("#" + g, c.grid.bDiv).css("display", "");
                        this[e] && d(c).jqGrid("expandRow", this)
                    })
                }
            })
        },
        collapseRow: function(a) {
            this.each(function() {
                var c = this;
                if (c.grid && c.p.treeGrid) {
                    var b = d(c).jqGrid("getNodeChildren", a),
                    e = c.p.treeReader.expanded_field;
                    d(b).each(function() {
                        var g = d.jgrid.getAccessor(this, c.p.localReader.id);
                        d("#" + g, c.grid.bDiv).css("display", "none");
                        this[e] && d(c).jqGrid("collapseRow", this)
                    })
                }
            })
        },
        getRootNodes: function() {
            var a = [];
            this.each(function() {
                var c = this;
                if (c.grid && c.p.treeGrid) switch (c.p.treeGridModel) {
                case "nested":
                    var b = c.p.treeReader.level_field;
                    d(c.p.data).each(function() {
                        parseInt(this[b], 10) === parseInt(c.p.tree_root_level, 10) && a.push(this)
                    });
                    break;
                case "adjacency":
                    var e = c.p.treeReader.parent_id_field;
                    d(c.p.data).each(function() {
                        if (this[e] === null || String(this[e]).toLowerCase() == "null") a.push(this)
                    })
                }
            });
            return a
        },
        getNodeDepth: function(a) {
            var c = null;
            this.each(function() {
                if (this.grid && this.p.treeGrid) switch (this.p.treeGridModel) {
                case "nested":
                    c = parseInt(a[this.p.treeReader.level_field], 10) - parseInt(this.p.tree_root_level, 10);
                    break;
                case "adjacency":
                    c = d(this).jqGrid("getNodeAncestors", a).length
                }
            });
            return c
        },
        getNodeParent: function(a) {
            var c = null;
            this.each(function() {
                if (this.grid && this.p.treeGrid) switch (this.p.treeGridModel) {
                case "nested":
                    var b = this.p.treeReader.left_field,
                    e = this.p.treeReader.right_field,
                    g = this.p.treeReader.level_field,
                    h = parseInt(a[b], 10),
                    f = parseInt(a[e], 10),
                    l = parseInt(a[g], 10);
                    d(this.p.data).each(function() {
                        if (parseInt(this[g], 10) === l - 1 && parseInt(this[b], 10) < h && parseInt(this[e], 10) > f) {
                            c = this;
                            return false
                        }
                    });
                    break;
                case "adjacency":
                    var i = this.p.treeReader.parent_id_field,
                    j = this.p.localReader.id;
                    d(this.p.data).each(function() {
                        if (this[j] == a[i]) {
                            c = this;
                            return false
                        }
                    })
                }
            });
            return c
        },
        getNodeChildren: function(a) {
            var c = [];
            this.each(function() {
                if (this.grid && this.p.treeGrid) switch (this.p.treeGridModel) {
                case "nested":
                    var b = this.p.treeReader.left_field,
                    e = this.p.treeReader.right_field,
                    g = this.p.treeReader.level_field,
                    h = parseInt(a[b], 10),
                    f = parseInt(a[e], 10),
                    l = parseInt(a[g], 10);
                    d(this.p.data).each(function() {
                        parseInt(this[g], 10) === l + 1 && parseInt(this[b], 10) > h && parseInt(this[e], 10) < f && c.push(this)
                    });
                    break;
                case "adjacency":
                    var i = this.p.treeReader.parent_id_field,
                    j = this.p.localReader.id;
                    d(this.p.data).each(function() {
                        this[i] == a[j] && c.push(this)
                    })
                }
            });
            return c
        },
        getFullTreeNode: function(a) {
            var c = [];
            this.each(function() {
                var b;
                if (this.grid && this.p.treeGrid) switch (this.p.treeGridModel) {
                case "nested":
                    var e = this.p.treeReader.left_field,
                    g = this.p.treeReader.right_field,
                    h = this.p.treeReader.level_field,
                    f = parseInt(a[e], 10),
                    l = parseInt(a[g], 10),
                    i = parseInt(a[h], 10);
                    d(this.p.data).each(function() {
                        parseInt(this[h], 10) >= i && parseInt(this[e], 10) >= f && parseInt(this[e], 10) <= l && c.push(this)
                    });
                    break;
                case "adjacency":
                    if (a) {
                        c.push(a);
                        var j = this.p.treeReader.parent_id_field,
                        o = this.p.localReader.id;
                        d(this.p.data).each(function(n) {
                            b = c.length;
                            for (n = 0; n < b; n++) if (c[n][o] == this[j]) {
                                c.push(this);
                                break
                            }
                        })
                    }
                }
            });
            return c
        },
        getNodeAncestors: function(a) {
            var c = [];
            this.each(function() {
                if (this.grid && this.p.treeGrid) for (var b = d(this).jqGrid("getNodeParent", a); b;) {
                    c.push(b);
                    b = d(this).jqGrid("getNodeParent", b)
                }
            });
            return c
        },
        isVisibleNode: function(a) {
            var c = true;
            this.each(function() {
                if (this.grid && this.p.treeGrid) {
                    var b = d(this).jqGrid("getNodeAncestors", a),
                    e = this.p.treeReader.expanded_field;
                    d(b).each(function() {
                        c = c && this[e];
                        if (!c) return false
                    })
                }
            });
            return c
        },
        isNodeLoaded: function(a) {
            var c;
            this.each(function() {
                if (this.grid && this.p.treeGrid) {
                    var b = this.p.treeReader.leaf_field;
                    c = a !== undefined ? a.loaded !== undefined ? a.loaded: a[b] || d(this).jqGrid("getNodeChildren", a).length > 0 ? true: false: false
                }
            });
            return c
        },
        expandNode: function(a) {
            return this.each(function() {
                if (this.grid && this.p.treeGrid) {
                    var c = this.p.treeReader.expanded_field,
                    b = this.p.treeReader.parent_id_field,
                    e = this.p.treeReader.loaded,
                    g = this.p.treeReader.level_field,
                    h = this.p.treeReader.left_field,
                    f = this.p.treeReader.right_field;
                    if (!a[c]) {
                        var l = d.jgrid.getAccessor(a, this.p.localReader.id),
                        i = d("#" + l, this.grid.bDiv)[0],
                        j = this.p._index[l];
                        if (d(this).jqGrid("isNodeLoaded", this.p.data[j])) {
                            a[c] = true;
                            d("div.treeclick", i).removeClass(this.p.treeIcons.plus + " tree-plus").addClass(this.p.treeIcons.minus + " tree-minus")
                        } else {
                            a[c] = true;
                            d("div.treeclick", i).removeClass(this.p.treeIcons.plus + " tree-plus").addClass(this.p.treeIcons.minus + " tree-minus");
                            this.p.treeANode = i.rowIndex;
                            this.p.datatype = this.p.treedatatype;
                            this.p.treeGridModel == "nested" ? d(this).jqGrid("setGridParam", {
                                postData: {
                                    nodeid: l,
                                    n_left: a[h],
                                    n_right: a[f],
                                    n_level: a[g]
                                }
                            }) : d(this).jqGrid("setGridParam", {
                                postData: {
                                    nodeid: l,
                                    parentid: a[b],
                                    n_level: a[g]
                                }
                            });
                            d(this).trigger("reloadGrid");
                            a[e] = true;
                            this.p.treeGridModel == "nested" ? d(this).jqGrid("setGridParam", {
                                postData: {
                                    nodeid: "",
                                    n_left: "",
                                    n_right: "",
                                    n_level: ""
                                }
                            }) : d(this).jqGrid("setGridParam", {
                                postData: {
                                    nodeid: "",
                                    parentid: "",
                                    n_level: ""
                                }
                            })
                        }
                    }
                }
            })
        },
        collapseNode: function(a) {
            return this.each(function() {
                if (this.grid && this.p.treeGrid) {
                    var c = this.p.treeReader.expanded_field;
                    if (a[c]) {
                        a[c] = false;
                        c = d.jgrid.getAccessor(a, this.p.localReader.id);
                        c = d("#" + c, this.grid.bDiv)[0];
                        d("div.treeclick", c).removeClass(this.p.treeIcons.minus + " tree-minus").addClass(this.p.treeIcons.plus + " tree-plus")
                    }
                }
            })
        },
        SortTree: function(a, c, b, e) {
            return this.each(function() {
                if (this.grid && this.p.treeGrid) {
                    var g, h, f, l = [],
                    i = this,
                    j;
                    g = d(this).jqGrid("getRootNodes");
                    g = d.jgrid.from(g);
                    g.orderBy(a, c, b, e);
                    j = g.select();
                    g = 0;
                    for (h = j.length; g < h; g++) {
                        f = j[g];
                        l.push(f);
                        d(this).jqGrid("collectChildrenSortTree", l, f, a, c, b, e)
                    }
                    d.each(l,
                    function(o) {
                        var n = d.jgrid.getAccessor(this, i.p.localReader.id);
                        d("#" + i.p.id + " tbody tr:eq(" + o + ")").after(d("tr#" + n, i.grid.bDiv))
                    });
                    l = j = g = null
                }
            })
        },
        collectChildrenSortTree: function(a, c, b, e, g, h) {
            return this.each(function() {
                if (this.grid && this.p.treeGrid) {
                    var f, l, i, j;
                    f = d(this).jqGrid("getNodeChildren", c);
                    f = d.jgrid.from(f);
                    f.orderBy(b, e, g, h);
                    j = f.select();
                    f = 0;
                    for (l = j.length; f < l; f++) {
                        i = j[f];
                        a.push(i);
                        d(this).jqGrid("collectChildrenSortTree", a, i, b, e, g, h)
                    }
                }
            })
        },
        setTreeRow: function(a, c) {
            var b = false;
            this.each(function() {
                if (this.grid && this.p.treeGrid) b = d(this).jqGrid("setRowData", a, c)
            });
            return b
        },
        delTreeNode: function(a) {
            return this.each(function() {
                var c = this.p.localReader.id,
                b = this.p.treeReader.left_field,
                e = this.p.treeReader.right_field,
                g, h, f;
                if (this.grid && this.p.treeGrid) {
                    var l = this.p._index[a];
                    if (l !== undefined) {
                        g = parseInt(this.p.data[l][e], 10);
                        h = g - parseInt(this.p.data[l][b], 10) + 1;
                        l = d(this).jqGrid("getFullTreeNode", this.p.data[l]);
                        if (l.length > 0) for (var i = 0; i < l.length; i++) d(this).jqGrid("delRowData", l[i][c]);
                        if (this.p.treeGridModel === "nested") {
                            c = d.jgrid.from(this.p.data).greater(b, g, {
                                stype: "integer"
                            }).select();
                            if (c.length) for (f in c) c[f][b] = parseInt(c[f][b], 10) - h;
                            c = d.jgrid.from(this.p.data).greater(e, g, {
                                stype: "integer"
                            }).select();
                            if (c.length) for (f in c) c[f][e] = parseInt(c[f][e], 10) - h
                        }
                    }
                }
            })
        },
        addChildNode: function(a, c, b) {
            var e = this[0];
            if (b) {
                var g = e.p.treeReader.expanded_field,
                h = e.p.treeReader.leaf_field,
                f = e.p.treeReader.level_field,
                l = e.p.treeReader.parent_id_field,
                i = e.p.treeReader.left_field,
                j = e.p.treeReader.right_field,
                o = e.p.treeReader.loaded,
                n, k, m, r, p;
                n = 0;
                var s = c,
                t;
                if (typeof a === "undefined" || a === null) {
                    p = e.p.data.length - 1;
                    if (p >= 0) for (; p >= 0;) {
                        n = Math.max(n, parseInt(e.p.data[p][e.p.localReader.id], 10));
                        p--
                    }
                    a = n + 1
                }
                var u = d(e).jqGrid("getInd", c);
                t = false;
                if (c === undefined || c === null || c === "") {
                    s = c = null;
                    n = "last";
                    r = e.p.tree_root_level;
                    p = e.p.data.length + 1
                } else {
                    n = "after";
                    k = e.p._index[c];
                    m = e.p.data[k];
                    c = m[e.p.localReader.id];
                    r = parseInt(m[f], 10) + 1;
                    p = d(e).jqGrid("getFullTreeNode", m);
                    if (p.length) {
                        s = p = p[p.length - 1][e.p.localReader.id];
                        p = d(e).jqGrid("getInd", s) + 1
                    } else p = d(e).jqGrid("getInd", c) + 1;
                    if (m[h]) {
                        t = true;
                        m[g] = true;
                        d(e.rows[u]).find("span.cell-wrapperleaf").removeClass("cell-wrapperleaf").addClass("cell-wrapper").end().find("div.tree-leaf").removeClass(e.p.treeIcons.leaf + " tree-leaf").addClass(e.p.treeIcons.minus + " tree-minus");
                        e.p.data[k][h] = false;
                        m[o] = true
                    }
                }
                k = p + 1;
                b[g] = false;
                b[o] = true;
                b[f] = r;
                b[h] = true;
                if (e.p.treeGridModel === "adjacency") b[l] = c;
                if (e.p.treeGridModel === "nested") {
                    var q;
                    if (c !== null) {
                        h = parseInt(m[j], 10);
                        f = d.jgrid.from(e.p.data);
                        f = f.greaterOrEquals(j, h, {
                            stype: "integer"
                        });
                        f = f.select();
                        if (f.length) for (q in f) {
                            f[q][i] = f[q][i] > h ? parseInt(f[q][i], 10) + 2 : f[q][i];
                            f[q][j] = f[q][j] >= h ? parseInt(f[q][j], 10) + 2 : f[q][j]
                        }
                        b[i] = h;
                        b[j] = h + 1
                    } else {
                        h = parseInt(d(e).jqGrid("getCol", j, false, "max"), 10);
                        f = d.jgrid.from(e.p.data).greater(i, h, {
                            stype: "integer"
                        }).select();
                        if (f.length) for (q in f) f[q][i] = parseInt(f[q][i], 10) + 2;
                        f = d.jgrid.from(e.p.data).greater(j, h, {
                            stype: "integer"
                        }).select();
                        if (f.length) for (q in f) f[q][j] = parseInt(f[q][j], 10) + 2;
                        b[i] = h + 1;
                        b[j] = h + 2
                    }
                }
                if (c === null || d(e).jqGrid("isNodeLoaded", m) || t) {
                    d(e).jqGrid("addRowData", a, b, n, s);
                    d(e).jqGrid("setTreeNode", p, k)
                }
                m && !m[g] && d(e.rows[u]).find("div.treeclick").click()
            }
        }
    })
})(jQuery); (function(b) {
    b.jgrid.extend({
        jqGridImport: function(a) {
            a = b.extend({
                imptype: "xml",
                impstring: "",
                impurl: "",
                mtype: "GET",
                impData: {},
                xmlGrid: {
                    config: "roots>grid",
                    data: "roots>rows"
                },
                jsonGrid: {
                    config: "grid",
                    data: "data"
                },
                ajaxOptions: {}
            },
            a || {});
            return this.each(function() {
                var d = this,
                c = function(f, g) {
                    var e = b(g.xmlGrid.config, f)[0],
                    h = b(g.xmlGrid.data, f)[0],
                    i;
                    if (xmlJsonClass.xml2json && b.jgrid.parse) {
                        e = xmlJsonClass.xml2json(e, " ");
                        e = b.jgrid.parse(e);
                        for (var l in e) if (e.hasOwnProperty(l)) i = e[l];
                        if (h) {
                            h = e.grid.datatype;
                            e.grid.datatype = "xmlstring";
                            e.grid.datastr = f;
                            b(d).jqGrid(i).jqGrid("setGridParam", {
                                datatype: h
                            })
                        } else b(d).jqGrid(i)
                    } else alert("xml2json or parse are not present")
                },
                j = function(f, g) {
                    if (f && typeof f == "string") {
                        var e = b.jgrid.parse(f),
                        h = e[g.jsonGrid.config];
                        if (e = e[g.jsonGrid.data]) {
                            var i = h.datatype;
                            h.datatype = "jsonstring";
                            h.datastr = e;
                            b(d).jqGrid(h).jqGrid("setGridParam", {
                                datatype: i
                            })
                        } else b(d).jqGrid(h)
                    }
                };
                switch (a.imptype) {
                case "xml":
                    b.ajax(b.extend({
                        url:
                        a.impurl,
                        type: a.mtype,
                        data: a.impData,
                        dataType: "xml",
                        complete: function(f, g) {
                            if (g == "success") {
                                c(f.responseXML, a);
                                b.isFunction(a.importComplete) && a.importComplete(f)
                            }
                        }
                    },
                    a.ajaxOptions));
                    break;
                case "xmlstring":
                    if (a.impstring && typeof a.impstring == "string") {
                        var k = b.jgrid.stringToDoc(a.impstring);
                        if (k) {
                            c(k, a);
                            b.isFunction(a.importComplete) && a.importComplete(k);
                            a.impstring = null
                        }
                        k = null
                    }
                    break;
                case "json":
                    b.ajax(b.extend({
                        url:
                        a.impurl,
                        type: a.mtype,
                        data: a.impData,
                        dataType: "json",
                        complete: function(f, g) {
                            if (g == "success") {
                                j(f.responseText, a);
                                b.isFunction(a.importComplete) && a.importComplete(f)
                            }
                        }
                    },
                    a.ajaxOptions));
                    break;
                case "jsonstring":
                    if (a.impstring && typeof a.impstring == "string") {
                        j(a.impstring, a);
                        b.isFunction(a.importComplete) && a.importComplete(a.impstring);
                        a.impstring = null
                    }
                }
            })
        },
        jqGridExport: function(a) {
            a = b.extend({
                exptype: "xmlstring",
                root: "grid",
                ident: "\t"
            },
            a || {});
            var d = null;
            this.each(function() {
                if (this.grid) {
                    var c = b.extend({},
                    b(this).jqGrid("getGridParam"));
                    if (c.rownumbers) {
                        c.colNames.splice(0, 1);
                        c.colModel.splice(0, 1)
                    }
                    if (c.multiselect) {
                        c.colNames.splice(0, 1);
                        c.colModel.splice(0, 1)
                    }
                    if (c.subGrid) {
                        c.colNames.splice(0, 1);
                        c.colModel.splice(0, 1)
                    }
                    c.knv = null;
                    if (c.treeGrid) for (var j in c.treeReader) if (c.treeReader.hasOwnProperty(j)) {
                        c.colNames.splice(c.colNames.length - 1);
                        c.colModel.splice(c.colModel.length - 1)
                    }
                    switch (a.exptype) {
                    case "xmlstring":
                        d = "<" + a.root + ">" + xmlJsonClass.json2xml(c, a.ident) + "</" + a.root + ">";
                        break;
                    case "jsonstring":
                        d = "{" + xmlJsonClass.toJson(c, a.root, a.ident, false) + "}";
                        if (c.postData.filters !== undefined) {
                            d = d.replace(/filters":"/, 'filters":');
                            d = d.replace(/}]}"/, "}]}")
                        }
                    }
                }
            });
            return d
        },
        excelExport: function(a) {
            a = b.extend({
                exptype: "remote",
                url: null,
                oper: "oper",
                tag: "excel",
                exportOptions: {}
            },
            a || {});
            return this.each(function() {
                if (this.grid) {
                    var d;
                    if (a.exptype == "remote") {
                        d = b.extend({},
                        this.p.postData);
                        d[a.oper] = a.tag;
                        d = jQuery.param(d);
                        d = a.url.indexOf("?") != -1 ? a.url + "&" + d: a.url + "?" + d;
                        window.location = d
                    }
                }
            })
        }
    })
})(jQuery);
var xmlJsonClass = {
    xml2json: function(a, b) {
        if (a.nodeType === 9) a = a.documentElement;
        var h = this.toJson(this.toObj(this.removeWhite(a)), a.nodeName, "\t");
        return "{\n" + b + (b ? h.replace(/\t/g, b) : h.replace(/\t|\n/g, "")) + "\n}"
    },
    json2xml: function(a, b) {
        var h = function(d, c, i) {
            var g = "",
            k, j;
            if (d instanceof Array) if (d.length === 0) g += i + "<" + c + ">__EMPTY_ARRAY_</" + c + ">\n";
            else {
                k = 0;
                for (j = d.length; k < j; k += 1) {
                    var l = i + h(d[k], c, i + "\t") + "\n";
                    g += l
                }
            } else if (typeof d === "object") {
                k = false;
                g += i + "<" + c;
                for (j in d) if (d.hasOwnProperty(j)) if (j.charAt(0) === "@") g += " " + j.substr(1) + '="' + d[j].toString() + '"';
                else k = true;
                g += k ? ">": "/>";
                if (k) {
                    for (j in d) if (d.hasOwnProperty(j)) if (j === "#text") g += d[j];
                    else if (j === "#cdata") g += "<![CDATA[" + d[j] + "]]\>";
                    else if (j.charAt(0) !== "@") g += h(d[j], j, i + "\t");
                    g += (g.charAt(g.length - 1) === "\n" ? i: "") + "</" + c + ">"
                }
            } else if (typeof d === "function") g += i + "<" + c + "><![CDATA[" + d + "]]\></" + c + ">";
            else {
                if (d === undefined) d = "";
                g += d.toString() === '""' || d.toString().length === 0 ? i + "<" + c + ">__EMPTY_STRING_</" + c + ">": i + "<" + c + ">" + d.toString() + "</" + c + ">"
            }
            return g
        },
        e = "",
        f;
        for (f in a) if (a.hasOwnProperty(f)) e += h(a[f], f, "");
        return b ? e.replace(/\t/g, b) : e.replace(/\t|\n/g, "")
    },
    toObj: function(a) {
        var b = {},
        h = /function/i;
        if (a.nodeType === 1) {
            if (a.attributes.length) {
                var e;
                for (e = 0; e < a.attributes.length; e += 1) b["@" + a.attributes[e].nodeName] = (a.attributes[e].nodeValue || "").toString()
            }
            if (a.firstChild) {
                var f = e = 0,
                d = false,
                c;
                for (c = a.firstChild; c; c = c.nextSibling) if (c.nodeType === 1) d = true;
                else if (c.nodeType === 3 && c.nodeValue.match(/[^ \f\n\r\t\v]/)) e += 1;
                else if (c.nodeType === 4) f += 1;
                if (d) if (e < 2 && f < 2) {
                    this.removeWhite(a);
                    for (c = a.firstChild; c; c = c.nextSibling) if (c.nodeType === 3) b["#text"] = this.escape(c.nodeValue);
                    else if (c.nodeType === 4) if (h.test(c.nodeValue)) b[c.nodeName] = [b[c.nodeName], c.nodeValue];
                    else b["#cdata"] = this.escape(c.nodeValue);
                    else if (b[c.nodeName]) if (b[c.nodeName] instanceof Array) b[c.nodeName][b[c.nodeName].length] = this.toObj(c);
                    else b[c.nodeName] = [b[c.nodeName], this.toObj(c)];
                    else b[c.nodeName] = this.toObj(c)
                } else if (a.attributes.length) b["#text"] = this.escape(this.innerXml(a));
                else b = this.escape(this.innerXml(a));
                else if (e) if (a.attributes.length) b["#text"] = this.escape(this.innerXml(a));
                else {
                    b = this.escape(this.innerXml(a));
                    if (b === "__EMPTY_ARRAY_") b = "[]";
                    else if (b === "__EMPTY_STRING_") b = ""
                } else if (f) if (f > 1) b = this.escape(this.innerXml(a));
                else for (c = a.firstChild; c; c = c.nextSibling) if (h.test(a.firstChild.nodeValue)) {
                    b = a.firstChild.nodeValue;
                    break
                } else b["#cdata"] = this.escape(c.nodeValue)
            }
            if (!a.attributes.length && !a.firstChild) b = null
        } else if (a.nodeType === 9) b = this.toObj(a.documentElement);
        else alert("unhandled node type: " + a.nodeType);
        return b
    },
    toJson: function(a, b, h, e) {
        if (e === undefined) e = true;
        var f = b ? '"' + b + '"': "",
        d = "\t",
        c = "\n";
        if (!e) c = d = "";
        if (a === "[]") f += b ? ":[]": "[]";
        else if (a instanceof Array) {
            var i, g, k = [];
            g = 0;
            for (i = a.length; g < i; g += 1) k[g] = this.toJson(a[g], "", h + d, e);
            f += (b ? ":[": "[") + (k.length > 1 ? c + h + d + k.join("," + c + h + d) + c + h: k.join("")) + "]"
        } else if (a === null) f += (b && ":") + "null";
        else if (typeof a === "object") {
            i = [];
            for (g in a) if (a.hasOwnProperty(g)) i[i.length] = this.toJson(a[g], g, h + d, e);
            f += (b ? ":{": "{") + (i.length > 1 ? c + h + d + i.join("," + c + h + d) + c + h: i.join("")) + "}"
        } else f += typeof a === "string" ? (b && ":") + '"' + a.replace(/\\/g, "\\\\").replace(/\"/g, '\\"') + '"': (b && ":") + '"' + a.toString() + '"';
        return f
    },
    innerXml: function(a) {
        var b = "";
        if ("innerHTML" in a) b = a.innerHTML;
        else {
            var h = function(e) {
                var f = "",
                d;
                if (e.nodeType === 1) {
                    f += "<" + e.nodeName;
                    for (d = 0; d < e.attributes.length; d += 1) f += " " + e.attributes[d].nodeName + '="' + (e.attributes[d].nodeValue || "").toString() + '"';
                    if (e.firstChild) {
                        f += ">";
                        for (d = e.firstChild; d; d = d.nextSibling) f += h(d);
                        f += "</" + e.nodeName + ">"
                    } else f += "/>"
                } else if (e.nodeType === 3) f += e.nodeValue;
                else if (e.nodeType === 4) f += "<![CDATA[" + e.nodeValue + "]]\>";
                return f
            };
            for (a = a.firstChild; a; a = a.nextSibling) b += h(a)
        }
        return b
    },
    escape: function(a) {
        return a.replace(/[\\]/g, "\\\\").replace(/[\"]/g, '\\"').replace(/[\n]/g, "\\n").replace(/[\r]/g, "\\r")
    },
    removeWhite: function(a) {
        a.normalize();
        var b;
        for (b = a.firstChild; b;) if (b.nodeType === 3) if (b.nodeValue.match(/[^ \f\n\r\t\v]/)) b = b.nextSibling;
        else {
            var h = b.nextSibling;
            a.removeChild(b);
            b = h
        } else {
            b.nodeType === 1 && this.removeWhite(b);
            b = b.nextSibling
        }
        return a
    }
};
function tableToGrid(n, o) {
    jQuery(n).each(function() {
        if (!this.grid) {
            jQuery(this).width("99%");
            var a = jQuery(this).width(),
            d = jQuery("tr td:first-child input[type=checkbox]:first", jQuery(this)),
            b = jQuery("tr td:first-child input[type=radio]:first", jQuery(this));
            d = d.length > 0;
            b = !d && b.length > 0;
            var l = d || b,
            c = [],
            g = [];
            jQuery("th", jQuery(this)).each(function() {
                if (c.length === 0 && l) {
                    c.push({
                        name: "__selection__",
                        index: "__selection__",
                        width: 0,
                        hidden: true
                    });
                    g.push("__selection__")
                } else {
                    c.push({
                        name: jQuery(this).attr("id") || jQuery.trim(jQuery.jgrid.stripHtml(jQuery(this).html())).split(" ").join("_"),
                        index: jQuery(this).attr("id") || jQuery.trim(jQuery.jgrid.stripHtml(jQuery(this).html())).split(" ").join("_"),
                        width: jQuery(this).width() || 150
                    });
                    g.push(jQuery(this).html())
                }
            });
            var f = [],
            h = [],
            i = [];
            jQuery("tbody > tr", jQuery(this)).each(function() {
                var j = {},
                e = 0;
                jQuery("td", jQuery(this)).each(function() {
                    if (e === 0 && l) {
                        var k = jQuery("input", jQuery(this)),
                        m = k.attr("value");
                        h.push(m || f.length);
                        k.is(":checked") && i.push(m);
                        j[c[e].name] = k.attr("value")
                    } else j[c[e].name] = jQuery(this).html();
                    e++
                });
                e > 0 && f.push(j)
            });
            jQuery(this).empty();
            jQuery(this).addClass("scroll");
            jQuery(this).jqGrid(jQuery.extend({
                datatype: "local",
                width: a,
                colNames: g,
                colModel: c,
                multiselect: d
            },
            o || {}));
            for (a = 0; a < f.length; a++) {
                b = null;
                if (h.length > 0) if ((b = h[a]) && b.replace) b = encodeURIComponent(b).replace(/[.\-%]/g, "_");
                if (b === null) b = a + 1;
                jQuery(this).jqGrid("addRowData", b, f[a])
            }
            for (a = 0; a < i.length; a++) jQuery(this).jqGrid("setSelection", i[a])
        }
    })
}; (function(a) {
    if (a.browser.msie && a.browser.version == 8) a.expr[":"].hidden = function(b) {
        return b.offsetWidth === 0 || b.offsetHeight === 0 || b.style.display == "none"
    };
    a.jgrid._multiselect = false;
    if (a.ui) if (a.ui.multiselect) {
        if (a.ui.multiselect.prototype._setSelected) {
            var q = a.ui.multiselect.prototype._setSelected;
            a.ui.multiselect.prototype._setSelected = function(b, h) {
                var c = q.call(this, b, h);
                if (h && this.selectedList) {
                    var f = this.element;
                    this.selectedList.find("li").each(function() {
                        a(this).data("optionLink") && a(this).data("optionLink").remove().appendTo(f)
                    })
                }
                return c
            }
        }
        if (a.ui.multiselect.prototype.destroy) a.ui.multiselect.prototype.destroy = function() {
            this.element.show();
            this.container.remove();
            a.Widget === undefined ? a.widget.prototype.destroy.apply(this, arguments) : a.Widget.prototype.destroy.apply(this, arguments)
        };
        a.jgrid._multiselect = true
    }
    a.jgrid.extend({
        sortableColumns: function(b) {
            return this.each(function() {
                function h() {
                    c.p.disableClick = true
                }
                var c = this,
                f = c.p.id;
                f = {
                    tolerance: "pointer",
                    axis: "x",
                    scrollSensitivity: "1",
                    items: ">th:not(:has(#jqgh_" + f + "_cb,#jqgh_" + f + "_rn,#jqgh_" + f + "_subgrid),:hidden)",
                    placeholder: {
                        element: function(g) {
                            return a(document.createElement(g[0].nodeName)).addClass(g[0].className + " ui-sortable-placeholder ui-state-highlight").removeClass("ui-sortable-helper")[0]
                        },
                        update: function(g, j) {
                            j.height(g.currentItem.innerHeight() - parseInt(g.currentItem.css("paddingTop") || 0, 10) - parseInt(g.currentItem.css("paddingBottom") || 0, 10));
                            j.width(g.currentItem.innerWidth() - parseInt(g.currentItem.css("paddingLeft") || 0, 10) - parseInt(g.currentItem.css("paddingRight") || 0, 10))
                        }
                    },
                    update: function(g, j) {
                        var i = a(j.item).parent();
                        i = a(">th", i);
                        var l = {},
                        m = c.p.id + "_";
                        a.each(c.p.colModel,
                        function(k) {
                            l[this.name] = k
                        });
                        var d = [];
                        i.each(function() {
                            var k = a(">div", this).get(0).id.replace(/^jqgh_/, "").replace(m, "");
                            k in l && d.push(l[k])
                        });
                        a(c).jqGrid("remapColumns", d, true, true);
                        a.isFunction(c.p.sortable.update) && c.p.sortable.update(d);
                        setTimeout(function() {
                            c.p.disableClick = false
                        },
                        50)
                    }
                };
                if (c.p.sortable.options) a.extend(f, c.p.sortable.options);
                else if (a.isFunction(c.p.sortable)) c.p.sortable = {
                    update: c.p.sortable
                };
                if (f.start) {
                    var e = f.start;
                    f.start = function(g, j) {
                        h();
                        e.call(this, g, j)
                    }
                } else f.start = h;
                if (c.p.sortable.exclude) f.items += ":not(" + c.p.sortable.exclude + ")";
                b.sortable(f).data("sortable").floating = true
            })
        },
        columnChooser: function(b) {
            function h(d, k) {
                if (d) if (typeof d == "string") a.fn[d] && a.fn[d].apply(k, a.makeArray(arguments).slice(2));
                else a.isFunction(d) && d.apply(k, a.makeArray(arguments).slice(2))
            }
            var c = this;
            if (!a("#colchooser_" + c[0].p.id).length) {
                var f = a('<div id="colchooser_' + c[0].p.id + '" style="position:relative;overflow:hidden"><div><select multiple="multiple"></select></div></div>'),
                e = a("select", f);
                b = a.extend({
                    width: 420,
                    height: 240,
                    classname: null,
                    done: function(d) {
                        d && c.jqGrid("remapColumns", d, true)
                    },
                    msel: "multiselect",
                    dlog: "dialog",
                    dlog_opts: function(d) {
                        var k = {};
                        k[d.bSubmit] = function() {
                            d.apply_perm();
                            d.cleanup(false)
                        };
                        k[d.bCancel] = function() {
                            d.cleanup(true)
                        };
                        return {
                            buttons: k,
                            close: function() {
                                d.cleanup(true)
                            },
                            modal: d.modal ? d.modal: false,
                            resizable: d.resizable ? d.resizable: true,
                            width: d.width + 20
                        }
                    },
                    apply_perm: function() {
                        a("option", e).each(function() {
                            this.selected ? c.jqGrid("showCol", g[this.value].name) : c.jqGrid("hideCol", g[this.value].name)
                        });
                        var d = [];
                        a("option:selected", e).each(function() {
                            d.push(parseInt(this.value, 10))
                        });
                        a.each(d,
                        function() {
                            delete i[g[parseInt(this, 10)].name]
                        });
                        a.each(i,
                        function() {
                            var k = parseInt(this, 10);
                            var p = d,
                            o = k;
                            if (o >= 0) {
                                var n = p.slice(),
                                r = n.splice(o, Math.max(p.length - o, o));
                                if (o > p.length) o = p.length;
                                n[o] = k;
                                d = n.concat(r)
                            } else d = void 0
                        });
                        b.done && b.done.call(c, d)
                    },
                    cleanup: function(d) {
                        h(b.dlog, f, "destroy");
                        h(b.msel, e, "destroy");
                        f.remove();
                        d && b.done && b.done.call(c)
                    },
                    msel_opts: {}
                },
                a.jgrid.col, b || {});
                if (a.ui) if (a.ui.multiselect) if (b.msel == "multiselect") {
                    if (!a.jgrid._multiselect) {
                        alert("Multiselect plugin loaded after jqGrid. Please load the plugin before the jqGrid!");
                        return
                    }
                    b.msel_opts = a.extend(a.ui.multiselect.defaults, b.msel_opts)
                }
                b.caption && f.attr("title", b.caption);
                if (b.classname) {
                    f.addClass(b.classname);
                    e.addClass(b.classname)
                }
                if (b.width) {
                    a(">div", f).css({
                        width: b.width,
                        margin: "0 auto"
                    });
                    e.css("width", b.width)
                }
                if (b.height) {
                    a(">div", f).css("height", b.height);
                    e.css("height", b.height - 10)
                }
                var g = c.jqGrid("getGridParam", "colModel"),
                j = c.jqGrid("getGridParam", "colNames"),
                i = {},
                l = [];
                e.empty();
                a.each(g,
                function(d) {
                    i[this.name] = d;
                    if (this.hidedlg) this.hidden || l.push(d);
                    else e.append("<option value='" + d + "' " + (this.hidden ? "": "selected='selected'") + ">" + j[d] + "</option>")
                });
                var m = a.isFunction(b.dlog_opts) ? b.dlog_opts.call(c, b) : b.dlog_opts;
                h(b.dlog, f, m);
                m = a.isFunction(b.msel_opts) ? b.msel_opts.call(c, b) : b.msel_opts;
                h(b.msel, e, m)
            }
        },
        sortableRows: function(b) {
            return this.each(function() {
                var h = this;
                if (h.grid) if (!h.p.treeGrid) if (a.fn.sortable) {
                    b = a.extend({
                        cursor: "move",
                        axis: "y",
                        items: ".jqgrow"
                    },
                    b || {});
                    if (b.start && a.isFunction(b.start)) {
                        b._start_ = b.start;
                        delete b.start
                    } else b._start_ = false;
                    if (b.update && a.isFunction(b.update)) {
                        b._update_ = b.update;
                        delete b.update
                    } else b._update_ = false;
                    b.start = function(c, f) {
                        a(f.item).css("border-width", "0px");
                        a("td", f.item).each(function(j) {
                            this.style.width = h.grid.cols[j].style.width
                        });
                        if (h.p.subGrid) {
                            var e = a(f.item).attr("id");
                            try {
                                a(h).jqGrid("collapseSubGridRow", e)
                            } catch(g) {}
                        }
                        b._start_ && b._start_.apply(this, [c, f])
                    };
                    b.update = function(c, f) {
                        a(f.item).css("border-width", "");
                        h.p.rownumbers === true && a("td.jqgrid-rownum", h.rows).each(function(e) {
                            a(this).html(e + 1 + (parseInt(h.p.page, 10) - 1) * parseInt(h.p.rowNum, 10))
                        });
                        b._update_ && b._update_.apply(this, [c, f])
                    };
                    a("tbody:first", h).sortable(b);
                    a("tbody:first", h).disableSelection()
                }
            })
        },
        gridDnD: function(b) {
            return this.each(function() {
                function h() {
                    var e = a.data(c, "dnd");
                    a("tr.jqgrow:not(.ui-draggable)", c).draggable(a.isFunction(e.drag) ? e.drag.call(a(c), e) : e.drag)
                }
                var c = this;
                if (c.grid) if (!c.p.treeGrid) if (a.fn.draggable && a.fn.droppable) {
                    a("#jqgrid_dnd").html() === null && a("body").append("<table id='jqgrid_dnd' class='ui-jqgrid-dnd'></table>");
                    if (typeof b == "string" && b == "updateDnD" && c.p.jqgdnd === true) h();
                    else {
                        b = a.extend({
                            drag: function(e) {
                                return a.extend({
                                    start: function(g, j) {
                                        if (c.p.subGrid) {
                                            var i = a(j.helper).attr("id");
                                            try {
                                                a(c).jqGrid("collapseSubGridRow", i)
                                            } catch(l) {}
                                        }
                                        for (i = 0; i < a.data(c, "dnd").connectWith.length; i++) a(a.data(c, "dnd").connectWith[i]).jqGrid("getGridParam", "reccount") == "0" && a(a.data(c, "dnd").connectWith[i]).jqGrid("addRowData", "jqg_empty_row", {});
                                        j.helper.addClass("ui-state-highlight");
                                        a("td", j.helper).each(function(m) {
                                            this.style.width = c.grid.headers[m].width + "px"
                                        });
                                        e.onstart && a.isFunction(e.onstart) && e.onstart.call(a(c), g, j)
                                    },
                                    stop: function(g, j) {
                                        if (j.helper.dropped && !e.dragcopy) {
                                            var i = a(j.helper).attr("id");
                                            a(c).jqGrid("delRowData", i)
                                        }
                                        for (i = 0; i < a.data(c, "dnd").connectWith.length; i++) a(a.data(c, "dnd").connectWith[i]).jqGrid("delRowData", "jqg_empty_row");
                                        e.onstop && a.isFunction(e.onstop) && e.onstop.call(a(c), g, j)
                                    }
                                },
                                e.drag_opts || {})
                            },
                            drop: function(e) {
                                return a.extend({
                                    accept: function(g) {
                                        if (!a(g).hasClass("jqgrow")) return g;
                                        g = a(g).closest("table.ui-jqgrid-btable");
                                        if (g.length > 0 && a.data(g[0], "dnd") !== undefined) {
                                            g = a.data(g[0], "dnd").connectWith;
                                            return a.inArray("#" + this.id, g) != -1 ? true: false
                                        }
                                        return false
                                    },
                                    drop: function(g, j) {
                                        if (a(j.draggable).hasClass("jqgrow")) {
                                            var i = a(j.draggable).attr("id");
                                            i = j.draggable.parent().parent().jqGrid("getRowData", i);
                                            if (!e.dropbyname) {
                                                var l = 0,
                                                m = {},
                                                d, k = a("#" + this.id).jqGrid("getGridParam", "colModel");
                                                try {
                                                    for (var p in i) {
                                                        if (i.hasOwnProperty(p) && k[l]) {
                                                            d = k[l].name;
                                                            m[d] = i[p]
                                                        }
                                                        l++
                                                    }
                                                    i = m
                                                } catch(o) {}
                                            }
                                            j.helper.dropped = true;
                                            if (e.beforedrop && a.isFunction(e.beforedrop)) {
                                                d = e.beforedrop.call(this, g, j, i, a("#" + c.id), a(this));
                                                if (typeof d != "undefined" && d !== null && typeof d == "object") i = d
                                            }
                                            if (j.helper.dropped) {
                                                var n;
                                                if (e.autoid) if (a.isFunction(e.autoid)) n = e.autoid.call(this, i);
                                                else {
                                                    n = Math.ceil(Math.random() * 1E3);
                                                    n = e.autoidprefix + n
                                                }
                                                a("#" + this.id).jqGrid("addRowData", n, i, e.droppos)
                                            }
                                            e.ondrop && a.isFunction(e.ondrop) && e.ondrop.call(this, g, j, i)
                                        }
                                    }
                                },
                                e.drop_opts || {})
                            },
                            onstart: null,
                            onstop: null,
                            beforedrop: null,
                            ondrop: null,
                            drop_opts: {
                                activeClass: "ui-state-active",
                                hoverClass: "ui-state-hover"
                            },
                            drag_opts: {
                                revert: "invalid",
                                helper: "clone",
                                cursor: "move",
                                appendTo: "#jqgrid_dnd",
                                zIndex: 5E3
                            },
                            dragcopy: false,
                            dropbyname: false,
                            droppos: "first",
                            autoid: true,
                            autoidprefix: "dnd_"
                        },
                        b || {});
                        if (b.connectWith) {
                            b.connectWith = b.connectWith.split(",");
                            b.connectWith = a.map(b.connectWith,
                            function(e) {
                                return a.trim(e)
                            });
                            a.data(c, "dnd", b);
                            c.p.reccount != "0" && !c.p.jqgdnd && h();
                            c.p.jqgdnd = true;
                            for (var f = 0; f < b.connectWith.length; f++) a(b.connectWith[f]).droppable(a.isFunction(b.drop) ? b.drop.call(a(c), b) : b.drop)
                        }
                    }
                }
            })
        },
        gridResize: function(b) {
            return this.each(function() {
                var h = this;
                if (h.grid && a.fn.resizable) {
                    b = a.extend({},
                    b || {});
                    if (b.alsoResize) {
                        b._alsoResize_ = b.alsoResize;
                        delete b.alsoResize
                    } else b._alsoResize_ = false;
                    if (b.stop && a.isFunction(b.stop)) {
                        b._stop_ = b.stop;
                        delete b.stop
                    } else b._stop_ = false;
                    b.stop = function(c, f) {
                        a(h).jqGrid("setGridParam", {
                            height: a("#gview_" + h.p.id + " .ui-jqgrid-bdiv").height()
                        });
                        a(h).jqGrid("setGridWidth", f.size.width, b.shrinkToFit);
                        b._stop_ && b._stop_.call(h, c, f)
                    };
                    b.alsoResize = b._alsoResize_ ? eval("(" + ("{'#gview_" + h.p.id + " .ui-jqgrid-bdiv':true,'" + b._alsoResize_ + "':true}") + ")") : a(".ui-jqgrid-bdiv", "#gview_" + h.p.id);
                    delete b._alsoResize_;
                    a("#gbox_" + h.p.id).resizable(b)
                }
            })
        }
    })
})(jQuery);

;(function($){
/**
 * jqGrid extension for manipulating columns properties
 * Piotr Roznicki roznicki@o2.pl
 * http://www.roznicki.prv.pl
 * Dual licensed under the MIT and GPL licenses:
 * http://www.opensource.org/licenses/mit-license.php
 * http://www.gnu.org/licenses/gpl-2.0.html
**/
$.jgrid.extend({
	setColumns : function(p) {
		p = $.extend({
			top : 0,
			left: 0,
			width: 200,
			height: 'auto',
			dataheight: 'auto',
			modal: false,
			drag: true,
			beforeShowForm: null,
			afterShowForm: null,
			afterSubmitForm: null,
			closeOnEscape : true,
			ShrinkToFit : false,
			jqModal : false,
			saveicon: [true,"left","ui-icon-disk"],
			closeicon: [true,"left","ui-icon-close"],
			onClose : null,
			colnameview : true,
			closeAfterSubmit : true,
			updateAfterCheck : false,
			recreateForm : false
		}, $.jgrid.col, p ||{});
		return this.each(function(){
			var $t = this;
			if (!$t.grid ) { return; }
			var onBeforeShow = typeof p.beforeShowForm === 'function' ? true: false;
			var onAfterShow = typeof p.afterShowForm === 'function' ? true: false;
			var onAfterSubmit = typeof p.afterSubmitForm === 'function' ? true: false;			
			var gID = $t.p.id,
			dtbl = "ColTbl_"+gID,
			IDs = {themodal:'colmod'+gID,modalhead:'colhd'+gID,modalcontent:'colcnt'+gID, scrollelm: dtbl};
			if(p.recreateForm===true && $("#"+IDs.themodal).html() != null) {
				$("#"+IDs.themodal).remove();
			}
			if ( $("#"+IDs.themodal).html() != null ) {
				if(onBeforeShow) { p.beforeShowForm($("#"+dtbl)); }
				$.jgrid.viewModal("#"+IDs.themodal,{gbox:"#gbox_"+gID,jqm:p.jqModal, jqM:false, modal:p.modal});
				if(onAfterShow) { p.afterShowForm($("#"+dtbl)); }
			} else {
				var dh = isNaN(p.dataheight) ? p.dataheight : p.dataheight+"px";
				var formdata = "<div id='"+dtbl+"' class='formdata' style='width:100%;overflow:auto;position:relative;height:"+dh+";'>";
				formdata += "<table class='ColTable' cellspacing='1' cellpading='2' border='0'><tbody>";
				for(i=0;i<this.p.colNames.length;i++){
					if(!$t.p.colModel[i].hidedlg) { // added from T. Tomov
						formdata += "<tr><td style='white-space: pre;'><input type='checkbox' style='margin-right:5px;' id='col_" + this.p.colModel[i].name + "' class='cbox' value='T' " + 
						((this.p.colModel[i].hidden===false)?"checked":"") + "/>" +  "<label for='col_" + this.p.colModel[i].name + "'>" + this.p.colNames[i] + ((p.colnameview) ? " (" + this.p.colModel[i].name + ")" : "" )+ "</label></td></tr>";
					}
				}
				formdata += "</tbody></table></div>"
				var bS  = !p.updateAfterCheck ? "<a href='javascript:void(0)' id='dData' class='fm-button ui-state-default ui-corner-all sureOn'>"+p.bSubmit+"</a>" : "",
				bC  ="<a href='javascript:void(0)' id='eData' class='fm-button ui-state-default ui-corner-all'>"+p.bCancel+"</a>";
				formdata += "<table border='0' class='EditTable' id='"+dtbl+"_2'><tbody><tr style='display:block;height:3px;'><td></td></tr><tr><td class='DataTD ui-widget-content'></td></tr><tr><td class='ColButton EditButton'>"+bS+"&#160;"+bC+"</td></tr></tbody></table>";
				p.gbox = "#gbox_"+gID;
				$.jgrid.createModal(IDs,formdata,p,"#gview_"+$t.p.id,$("#gview_"+$t.p.id)[0]);
				if(p.saveicon[0]==true) {
					$("#dData","#"+dtbl+"_2").addClass(p.saveicon[1] == "right" ? 'fm-button-icon-right' : 'fm-button-icon-left')
					.append("<span class='ui-icon "+p.saveicon[2]+"'></span>");
				}
				if(p.closeicon[0]==true) {
					$("#eData","#"+dtbl+"_2").addClass(p.closeicon[1] == "right" ? 'fm-button-icon-right' : 'fm-button-icon-left')
					.append("<span class='ui-icon "+p.closeicon[2]+"'></span>");
				}
				if(!p.updateAfterCheck) {
					$("#dData","#"+dtbl+"_2").click(function(e){
						for(i=0;i<$t.p.colModel.length;i++){
							if(!$t.p.colModel[i].hidedlg) { // added from T. Tomov
								var nm = $t.p.colModel[i].name.replace(/\./g, "\\.");
								if($("#col_" + nm,"#"+dtbl).attr("checked")) {
									$($t).jqGrid("showCol",$t.p.colModel[i].name);
									$("#col_" + nm,"#"+dtbl).attr("defaultChecked",true); // Added from T. Tomov IE BUG
								} else {
									$($t).jqGrid("hideCol",$t.p.colModel[i].name);
									$("#col_" + nm,"#"+dtbl).attr("defaultChecked",""); // Added from T. Tomov IE BUG
								}
							}
						}
						if(p.ShrinkToFit===true) {
							$($t).jqGrid("setGridWidth",$t.grid.width-0.001,true);
						}
						if(p.closeAfterSubmit) $.jgrid.hideModal("#"+IDs.themodal,{gb:"#gbox_"+gID,jqm:p.jqModal, onClose: p.onClose});
						if (onAfterSubmit) { p.afterSubmitForm($("#"+dtbl)); }
						return false;
					});
				} else {
					$(":input","#"+dtbl).click(function(e){
						var cn = this.id.substr(4);
						if(cn){
							if(this.checked) {
								$($t).jqGrid("showCol",cn);
							} else {
								$($t).jqGrid("hideCol",cn);
							}
							if(p.ShrinkToFit===true) {
								$($t).jqGrid("setGridWidth",$t.grid.width-0.001,true);
							}
						}
						return this;
					});
				}
				$("#eData", "#"+dtbl+"_2").click(function(e){
					$.jgrid.hideModal("#"+IDs.themodal,{gb:"#gbox_"+gID,jqm:p.jqModal, onClose: p.onClose});
					return false;
				});
				$("#dData, #eData","#"+dtbl+"_2").hover(
				   function(){$(this).addClass('ui-state-hover');}, 
				   function(){$(this).removeClass('ui-state-hover');}
				);				
				if(onBeforeShow) { p.beforeShowForm($("#"+dtbl)); }
				$.jgrid.viewModal("#"+IDs.themodal,{gbox:"#gbox_"+gID,jqm:p.jqModal, jqM: true, modal:p.modal});
				if(onAfterShow) { p.afterShowForm($("#"+dtbl)); }
			}
		});
	}
});
})(jQuery);