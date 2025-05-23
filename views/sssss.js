<script>
window.jQuery || document.write("<script src='https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js'><\/script>");
</script>

<script>
function utilGetParameterByName(e, t) {
    void 0 === t && (t = window.location.search);
    var o = "[\\?&]" + (e = e.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]")) + "=([^&#]*)",
        n = new RegExp(o).exec(t);
    return null === n ? "" : decodeURIComponent(n[1].replace(/\+/g, " "))
}

function CollectionFilterHandleGet() {
    var e;
    return "/" == window.location.pathname ? "all" : (e = window.location.pathname.substring("/collections/".length), e = e.split("/")[0])
}

function CollectionFilterLegacyTagsGet() {
    var e;
    return "/" == window.location.pathname ? "" : 1 == (e = window.location.pathname.substring("/collections/".length)).split("/").length ? "" : e = e.split("/")[1]
}

function CollectionFilterSetProductDetailVariant(e, t) {
    for (var o = [], n = 0; n < t.length; n++)
        for (r = 0; r < e.options.length; r++) {
            var i = e.options[r];
            i.name.toLowerCase() == t[n].option_name.toLowerCase() && o.push({
                position: i.position,
                title: t[n].variant_title
            })
        }
    if (0 != o.length && 1 != e.variants.length)
        for (n = 0; n < e.variants.length; n++) {
            var a = e.variants[n];
            if (!(a.title.indexOf("% Off") > -1) && !("shopify" == a.inventory_management && "deny" == a.inventory_policy && a.inventory_quantity <= 0)) {
                for (var l = !0, r = 0; r < o.length; r++) a["option" + o[r].position] != o[r].title && (l = !1);
                if (l) return window.location.href = window.location.pathname + "?variant=" + a.id, void(document.querySelector("[name='id']").value = a.id)
            }
        }
}

function CollectionFilterFlushHandle() {
    "yes" == utilGetParameterByName("debug") && console.log("CollectionFilterFlush()"), window.cfDocCookies.keys().filter(function(e) {
        return 0 == e.indexOf("cf-handle")
    }).map(function(e) {
        window.cfDocCookies.removeItem(e, "/")
    })
}

function CollectionFilterFlush() {
    "yes" == utilGetParameterByName("debug") && console.log("CollectionFilterFlush()"), window.cfDocCookies.keys().filter(function(e) {
        return 0 == e.indexOf("cf-")
    }).map(function(e) {
        window.cfDocCookies.removeItem(e, "/")
    })
}

function CollectionFilterInitialize() {
    if ("yes" == utilGetParameterByName("debug") && console.log("CollectionFilterInitialize"), window.location.pathname.indexOf("/products/") > -1) {
        if ("" == utilGetParameterByName("variant") && (o = window.cfDocCookies.getItem("cf-app-selected-filters")) && "string" == typeof o) {
            var e = JSON.parse(o);
            e.length > 0 && jQuery.getJSON(window.location.pathname + ".json", function(t) {
                CollectionFilterSetProductDetailVariant(t.product, e)
            })
        }
    } else {
        if ("/search" == window.location.pathname || "/" == window.location.pathname);
        else if (-1 == window.location.pathname.indexOf("/collections/")) return;
        var t = Math.floor((new Date).getTime() / 1e3),
            o = window.cfDocCookies.getItem("cf-last_update_hours");
        o && "string" == typeof o ? t - parseInt(o) >= 600 && CollectionFilterFlush() : CollectionFilterFlush(), "" != utilGetParameterByName("sort_by") && window.cfDocCookies.setItem("cf-app-remember-sort_by", utilGetParameterByName("sort_by"), null, "/"), "" != utilGetParameterByName("view") && window.cfDocCookies.setItem("cf-app-remember-view", utilGetParameterByName("view"), null, "/"), (o = window.cfDocCookies.getItem("cf-app_settings")) && "string" == typeof o && (window.appcf.app_settings = JSON.parse(window.cfDocCookies.getItem("cf-app_settings")));
        var n = CollectionFilterHandleGet();
        if ((o = window.cfDocCookies.getItem("cf-handle-" + n)) && "string" == typeof o && (window.appcf.filters = JSON.parse(o)), "yes" == utilGetParameterByName("debug") && console.log("CollectionFilterInitialize app_settings", window.appcf.app_settings, "filters", window.appcf.filters), window.appcf.app_settings && window.appcf.filters ? (CollectionFilterCheckRemember(n), CollectionFilterPopulateOptions(n)) : jQuery.ajax({
            cache: !0,
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            type: "GET",
            url: window.appcf.api_get,
            data: {
                shop: window.appcf.shop,
                handle: n.trim().toLowerCase()
            },
            success: function(e) {
                ////console.log(e)
                0 != e.filters.options.length && ("yes" == utilGetParameterByName("debug") && (console.log("CF got data data.filters.options.length",
                    e.filters.options.length), console.log("CF got data data.filters.options[0].values.length",
                    e.filters.options[0].values.length)),
                    window.appcf.app_settings = e.app_settings,
                    window.cfDocCookies.setItem("cf-app_settings", JSON.stringify(window.appcf.app_settings), null, "/"),
                    window.appcf.filters = e.filters, CollectionFilterFlushHandle(),
                    window.cfDocCookies.setItem("cf-handle-" + n, JSON.stringify(window.appcf.filters), null, "/"),
                    window.cfDocCookies.setItem("cf-last_update_hours", t, null, "/"), CollectionFilterCheckRemember(n), CollectionFilterPopulateOptions(n))
            }
        }), "/search" == window.location.pathname) {
            var i = CollectionFilterGetSearchValuesNoTags();
            jQuery("input[name='q']").val(i.join(" "))
        }
    }

}

function CollectionFilterSelectedFiltersGet(e) {
    var t = "",
        o = [];
    return "string" == typeof(t = "/search" == window.location.pathname ? utilGetParameterByName("q") : window.location.pathname.replace("/collections/" + e, "").replace("/", "")) && "" != t && (o = (t = decodeURIComponent(t)).toLowerCase().split("+")), o
}

function CollectionFilterSetRemember(e, t) {
    var o = [],
        n = window.cfDocCookies.getItem("cf-app-remember-tags");
    n && "string" == typeof n && (o = JSON.parse(n));
    for (r = 0; r < t.length; r++) - 1 == o.indexOf(t[r]) && o.push(t[r]);
    var i = [],
        a = [];
    "object" == typeof window.appcf.filters.options && (a = window.appcf.filters.options);
    for (var l = [], r = 0; r < a.length; r++)
        for (var c = 0; c < a[r].values.length; c++) l.push(a[r].values[c].tag);
    for (r = 0; r < o.length; r++) l.indexOf(o[r]) > -1 ? t.indexOf(o[r]) > -1 && i.push(o[r]) : i.push(o[r]);
    window.cfDocCookies.setItem("cf-app-remember-tags", JSON.stringify(i), null, "/")
}

function CollectionFilterCheckRemember(e) {
    if ("/" != window.location.pathname && "/search" != window.location.pathname) {
        var t = CollectionFilterSelectedFiltersGet(e),
            o = [],
            n = window.cfDocCookies.getItem("cf-app-remember-tags");
        n && "string" == typeof n && (o = JSON.parse(n));
        var i = [];
        "object" == typeof window.appcf.filters.options && (i = window.appcf.filters.options);
        for (var a = [], l = 0; l < i.length; l++)
            for (var r = 0; r < i[l].values.length; r++) a.push(i[l].values[r].tag);
        for (var c = [], l = 0; l < o.length; l++) a.indexOf(o[l]) > -1 && -1 == t.indexOf(o[l].toLowerCase()) && c.push(o[l]);
        s = "";
        if ((n = window.cfDocCookies.getItem("cf-app-remember-sort_by")) && "string" == typeof n) var s = n;
        0 == c.length && s == utilGetParameterByName("sort_by") || (t.push.apply(t, c), CollectionFilterRedirect(e, t))
    }
}

function CollectionFilterPopulateOptions(e) {
    "yes" == utilGetParameterByName("debug") && console.log("CollectionFilterPopulateOptions", e);
    var t = window.appcf.app_settings,
        o = [];
    "object" == typeof window.appcf.filters.options && (o = window.appcf.filters.options), void 0 === t.show_only_options && (t.show_only_options = ""), t.show_only_options = t.show_only_options.trim();
    var n = [];
    "" != t.show_only_options && (n = t.show_only_options.split(","));
    var i = "",
        a = CollectionFilterSelectedFiltersGet(e);
    if (void 0 === t.appearance && (t.appearance = []), void 0 === t.production_mode && (t.production_mode = !1), 0 == t.production_mode && CollectionFilterFlush(), 0 == t.appearance.length)
        for (var r = 0; r < n.length; r++) t.appearance.push({
            name: n[r],
            label: "",
            style: "select",
            all: ""
        });
    var c = [];
    "yes" == utilGetParameterByName("debug") && console.log("options", o, "app_settings", t);
    for (var s = 0; s < t.appearance.length; s++) {
        var p = t.appearance[s],
            f = o.filter(function(e) {
                return e.name.toLowerCase() == p.name.toLowerCase()
            });
        if (1 == f.length && (f = f[0], "yes" == utilGetParameterByName("debug") && l("option0", f), !(t.production_mode && f.values.length <= 1))) {
             i += " <span class='cf-options-container' style='display: inline-block !important;'> ";
            var u = 720;
            if ("number" == typeof window.cf_mobile_width && (u = window.cf_mobile_width), jQuery(window).width() <= u && (p.style = "select"), "select" == p.style) {
                i += "<ul style='background: #998fb8; width: 150px; text-align: left; padding: 7px; list-style-type: none'><li  onmouseenter='show_dropdown(this)' onmouseleave='hide_dropdown(this)'>"+ ("" == p.label ? p.name : p.label) +"</li class='yb_sub-menu'><li style='display: none;'><ul  style='border:none; color:#959599' class=''>", i += "<li value='' style='list-style-type: none'>" + ("string" == typeof p.all ? p.all : "") + "</li>";
                for (h = 0; h < f.values.length; h++) i += "<li  style='list-style-type: none' value='" + f.values[h].tag + "' ", a.indexOf(f.values[h].tag.toLowerCase()) >= 0 && (i += " selected", c.push({
                    option_name: f.name,
                    variant_title: f.values[h].name
                })), i += ">" + f.values[h].name + "</li>";
                i += "</ul></li></ul>"
            }
            if ("checkboxes" == p.style) {
                for (var d = !1, m = "string" == typeof p.all ? p.all : "", w = "", h = 0; h < f.values.length; h++) {
                    var g = "cf-" + CollectionFilterConvertToSlug(p.name) + "-",
                        y = f.values[h].tag.replace(g, "");
                    w += "<label><input class='cf-checkbox' name='" + p.name + "[]' data-group-name='" + p.name + "' type='checkbox' value='" + f.values[h].tag + "' id='" + y + "'    ", w += (a.indexOf(f.values[h].tag.toLowerCase()) >= 0 ? " checked " : "") + " > <span>" + f.values[h].name + "</span></label>", a.indexOf(f.values[h].tag.toLowerCase()) >= 0 && (d = !0, c.push({
                        option_name: f.name,
                        variant_title: f.values[h].name
                    }))
                }
                "" != m && (i += "<label><input class='cf-checkbox' name='" + p.name + "[]' data-group-name='" + p.name + "' type='checkbox' value='' id=''    ", 0 == d && (i += " checked "), i += " > <span>" + m + "</span></label>"), i += w
            }
            if ("radios" == p.style) {
                i += "<label><input class='cf-radio' data-group-name='" + p.name + "' type='radio' value='' ", i += " > <span>" + ("string" == typeof p.all ? p.all : "View All") + "</span></label>";
                for (h = 0; h < f.values.length; h++) i += "<label><input class='cf-radio' data-group-name='" + p.name + "' type='radio' value='" + f.values[h].tag + "' ", i += (a.indexOf(f.values[h].tag.toLowerCase()) >= 0 ? " checked " : "") + " > <span>" + f.values[h].name + "</span></label>", a.indexOf(f.values[h].tag.toLowerCase()) >= 0 && c.push({
                    option_name: f.name,
                    variant_title: f.values[h].name
                })
            }
            i += " </span>"
        }
    }

    /** customization **/
    ////    i = i.replace('<select', '<select size="200"', i);
    console.log(i);
    jQuery("#collection-filters-container").css({'position':'relative'})
    ////jQuery(i).find('cf-select').prop('size','200');
    /** customization **/

    "yes" == utilGetParameterByName("debug") && console.log("CF ohtml", i), jQuery(".collection-filters-container").html(i),
        jQuery("#collection-filters-container").html(i), "yes" == utilGetParameterByName("debug") && (console.log("ohtml", i), console.log("collection-filters-container", jQuery(".collection-filters-container").length)), setTimeout(function() {
        jQuery(".cf-select").bind("change", CollectionFilterChange), jQuery(".cf-checkbox").bind("change", CollectionFilterChange), jQuery(".cf-radio").bind("change", CollectionFilterChange), utilGetParameterByName("debug"), "function" == typeof CollectionFilterReady && CollectionFilterReady()


    }, 600), window.cfDocCookies.setItem("cf-app-selected-filters", JSON.stringify(c), null, "/")
}

function CollectionFilterGetSearchValuesNoTags() {
    if ("/search" != window.location.pathname) return [];
    var e = [];
    "" != utilGetParameterByName("q") && (e = utilGetParameterByName("q").split(" "));
    for (var t = [], o = 0; o < e.length; o++) - 1 == e[o].indexOf("tag:") && t.push(e[o]);
    return t
}

function CollectionFilterRedirect(e, t) {
    if ("/search" == window.location.pathname) {
        for (var o = CollectionFilterGetSearchValuesNoTags(), n = 0; n < t.length; n++) o.push("tag:" + t[n]);
        window.location = "/search?type=" + utilGetParameterByName("type") + "&q=" + o.join("+")
    } else {
        var i = "/collections/" + e + "/" + t.join("+");
        i = i.replace(/&/g, "%26");
        var a = utilGetParameterByName("sort_by");
        void 0 !== a && "" != a || (r = window.cfDocCookies.getItem("cf-app-remember-sort_by")) && "string" == typeof r && (a = r), void 0 === a || "" == a || (i.indexOf("?") > -1 ? i += "&" : i += "?", i += "sort_by=" + a);
        var l = utilGetParameterByName("view");
        if (void 0 === l || "" == l) {
            var r = window.cfDocCookies.getItem("cf-app-remember-view");
            r && "string" == typeof r && (l = r)
        }
        void 0 === a || "" == l || (i.indexOf("?") > -1 ? i += "&" : i += "?", i += "view=" + l), window.location.href = i
    }
}

function CollectionFilterChange(e) {
    var t = jQuery(e.currentTarget).data("group-name"),
        o = "",
        n = CollectionFilterHandleGet();
    void 0 !== t && (o = jQuery(e.currentTarget).val());
    var i = jQuery(e.currentTarget).closest(".collection-filters-container");
    0 == i.length && (i = jQuery(e.currentTarget).closest("#collection-filters-container"));
    var a = [];
    i.find(".cf-select").each(function(e) {
        var t = jQuery(this).val();
        "" != t && a.push(t)
    }), i.find(".cf-checkbox:checked").each(function(e) {
        var n = jQuery(this).val();
        "" != n && (jQuery(this).data("group-name") != t ? a.push(n) : n == o && a.push(n))
    }), i.find(".cf-radio:checked").each(function(e) {
        var n = jQuery(this).val();
        "" != n && (jQuery(this).data("group-name") != t ? "" != n && a.push(n) : n == o && a.push(n))
    }), CollectionFilterSetRemember(n, a), CollectionFilterRedirect(n, a)
}

function CollectionFilterStart() {
    if ("function" == typeof jQuery) {
        if ("number" != typeof window.app_cf_started) {
            window.app_cf_started = 1, window.l = function() {};
            try {
                window.l = console.log.bind(console)
            } catch (e) {}
            utilGetParameterByName("env");
            window.appcf = {
                shop: "{{shop.permanent_domain | remove: '.myshopify.com' }}",
                api_get: "https://collection-filter-www.herokuapp.com/api/v1/filters",
                app_settings: null,
                filters: null
            }, "sadev3.myshopify.com" == window.location.host && (window.appcf.api_get = "https://localhost/api/v1/filters"), CollectionFilterInitialize()
        }
    } else console.log("please add jQuery to shop theme.liquid")
}

function CollectionFilterConvertToSlug(e) {
    return e.toLowerCase().replace(/ /g, "-").replace(/[^\w-]+/g, "")
}


function make_dropdown(e){
    var len = $(e).children().length;
    $(e).attr('size', len);
    $(e).focus();

    //// $(e).css({'position':'absolute', 'width':'150px', 'left':'0px', 'top':'0px'});
}

function show_dropdown(e){
    $(e).next().show();
}

function hide_dropdown(e){
    $(e).next().hide();
}

function revert_dropdown(e){
    jQuery(e).attr('size','1');
}



window.cfDocCookies = {
    getItem: function(e) {
        return e ? decodeURIComponent(document.cookie.replace(new RegExp("(?:(?:^|.*;)\\s*" + encodeURIComponent(e).replace(/[\-\.\+\*]/g, "\\$&") + "\\s*\\=\\s*([^;]*).*$)|^.*$"), "$1")) || null : null
    },
    setItem: function(e, t, o, n, i, a) {
        if (!e || /^(?:expires|max\-age|path|domain|secure)$/i.test(e)) return !1;
        var l = "";
        if (o) switch (o.constructor) {
            case Number:
                l = o === 1 / 0 ? "; expires=Fri, 31 Dec 9999 23:59:59 GMT" : "; max-age=" + o;
                break;
            case String:
                l = "; expires=" + o;
                break;
            case Date:
                l = "; expires=" + o.toUTCString()
        }
        return document.cookie = encodeURIComponent(e) + "=" + encodeURIComponent(t) + l + (i ? "; domain=" + i : "") + (n ? "; path=" + n : "") + (a ? "; secure" : ""), !0
    },
    removeItem: function(e, t, o) {
        return !!this.hasItem(e) && (document.cookie = encodeURIComponent(e) + "=; expires=Thu, 01 Jan 1970 00:00:00 GMT" + (o ? "; domain=" + o : "") + (t ? "; path=" + t : ""), !0)
    },
    hasItem: function(e) {
        return !!e && new RegExp("(?:^|;\\s*)" + encodeURIComponent(e).replace(/[\-\.\+\*]/g, "\\$&") + "\\s*\\=").test(document.cookie)
    },
    keys: function() {
        for (var e = document.cookie.replace(/((?:^|\s*;)[^\=]+)(?=;|$)|^\s*|\s*(?:\=[^;]*)?(?:\1|$)/g, "").split(/\s*(?:\=[^;]*)?;\s*/), t = e.length, o = 0; o < t; o++) e[o] = decodeURIComponent(e[o]);
        return e
    }
}, CollectionFilterStart();
</script>