<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <title>Shiro Demo | 登录</title>
    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport"/>
    <link rel="icon" href="http://img.wenyifan.net/images/favicon.ico" type="image/x-icon"/>
    <link rel="shortcut icon" href="http://img.wenyifan.net/images/favicon.ico"/>
    <!-- CSS -->
    <link rel="stylesheet" href="http://open.sojson.com/itboy/js/itboy/app/reset.css">
    <link rel="stylesheet" href="http://open.sojson.com/itboy/js/itboy/app/supersized.css">
    <link rel="stylesheet" href="http://open.sojson.com/itboy/js/itboy/app/style.css"/>
    <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
    <script src="http://static.supportfolios.com/js/www/html5shiv.js"></script>
    <![endif]-->
    <style>
        canvas {
            position: fixed;
            top: 0px;
            left: 0px;
        }
    </style>
</head>

<body id="body">
<script></script>
<#--
<script src="http://cdn.maxjia.com/js/particles.min.js"></script>
<script>
    particlesJS('particles-js',
      {
        "particles": {
          "number": {
            "value": 110,
            "density": {
              "enable": true,
              "value_area": 800
            }
          },
          "color": {
            "value": "#ffffff"
          },
          "shape": {
            "type": "circle",
            "stroke": {
              "width": 0,
              "color": "#000000"
            },
            "polygon": {
              "nb_sides": 5
            },
            "image": {
              "src": "img/github.svg",
              "width": 100,
              "height": 100
            }
          },
          "opacity": {
            "value": 0.5,
            "random": false,
            "anim": {
              "enable": false,
              "speed": 1,
              "opacity_min": 0.1,
              "sync": false
            }
          },
          "size": {
            "value": 1,
            "random": true,
            "anim": {
              "enable": false,
              "speed": 20,
              "size_min": 0.1,
              "sync": false
            }
          },
          "line_linked": {
            "enable": true,
            "distance": 40,
            "color": "#fff",
            "opacity": 1,
            "width": 1
          },
          "move": {
            "enable": true,
            "speed": 3,
            "direction": "none",
            "random": false,
            "straight": false,
            "out_mode": "out",
            "attract": {
              "enable": false,
              "rotateX": 600,
              "rotateY": 1200
            }
          }
        },
        "interactivity": {
          "detect_on": "canvas",
          "events": {
            "onhover": {
              "enable": true,
              "mode": "grab"
            },
            "onclick": {
              "enable": true,
              "mode": "push"
            },
            "resize": true
          },
          "modes": {
            "grab": {
              "distance": 120,
              "line_linked": {
                "opacity": 1
              }
            },
            "bubble": {
              "distance": 400,
              "size": 40,
              "duration": 2,
              "opacity": 8,
              "speed": 3
            },
            "repulse": {
              "distance": 300
            },
            "push": {
              "particles_nb": 4
            },
            "remove": {
              "particles_nb": 2
            }
          }
        },
        "retina_detect": true,
        "config_demo": {
          "hide_card": false,
          "background_color": "#b61924",
          "background_image": "",
          "background_position": "50% 50%",
          "background_repeat": "no-repeat",
          "background_size": "cover"
        }
      }
    );
</script>
-->
<div class="page-container">
    <h1>Login</h1>
    <form id="_form" action="" method="post">
        <input type="text" name="account" class="username" placeholder="Account">
        <input type="password" name="password" class="password" placeholder="Password">
        <div style="text-align: left; margin-left: 10px;">
            <label><input type="checkbox" checked="checked" id="rememberMe"
                          style="width: 10px; height: 10px;">记住我</label>
        </div>
        <button type="button" id="login">登录</button>
        <button type="button" id="register" class="register">Register</button>
        <div class="connect">
            <p>有问题请这样解决:</p>
            <p>
                <a class="" style="width: auto; color: rgb(255, 255, 255);" target="_blank"
                   href="http://www.sojson.com/shiro">点我看本项目介绍</a>
                <a class="" style="width: auto; color: rgb(255, 255, 255);" target="_blank"
                   href="http://jq.qq.com/?_wv=1027&k=YpqCNd">加QQ群：259217951交流</a>
            </p>
        </div>

        <div class="error"><span>+</span></div>
    </form>
</div>
<!-- Javascript -->
<script src="http://open.sojson.com/common/jquery/jquery1.8.3.min.js"></script>
<script src="http://open.sojson.com/common/MD5.js"></script>
<script src="http://open.sojson.com/itboy/js/itboy/app/supersized.3.2.7.min.js"></script>
<script src="http://open.sojson.com/itboy/js/itboy/app/supersized-init.js"></script>
<script src="${basePath}/js/common/layer/layer.js"></script>
<script>
    jQuery(document).ready(function () {
        try {
            var _href = window.location.href + "";
            if (_href && _href.indexOf('?kickout') != -1) {
                layer.msg('您已经被踢出，请重新登录！');
            }
        } catch (e) {

        }
        //回车事件绑定
        document.onkeydown = function (event) {
            var e = event || window.event || arguments.callee.caller.arguments[0];
            if (e && e.keyCode == 13) {
                $('#login').click();
            }
        };

        //登录操作
        $('#login').click(function () {

            var username = $('.username').val();
            var password = $('.password').val();
            if (username == '') {
                $('.error').fadeOut('fast', function () {
                    $('.error').css('top', '27px').show();
                });
                $('.error').fadeIn('fast', function () {
                    $('.username').focus();
                });
                return false;
            }
            if (password == '') {
                $('.error').fadeOut('fast', function () {
                    $('.error').css('top', '96px').show();
                });
                $(this).find('.error').fadeIn('fast', function () {
                    $('.password').focus();
                });
                return false;
            }
            var pswd = MD5(username + "#" + password),
                    data = {pswd: pswd, email: username, rememberMe: $("#rememberMe").is(':checked')};
            var load = layer.load();
            $.post("${basePath}/u/submitLogin.shtml", data, function (result) {
                layer.close(load);
                if (result && result.status != 200) {
                    layer.msg(result.message, function () {
                    });
                    $('.password').val('');
                    return;
                } else {
                    layer.msg('登录成功！');
                    setTimeout(function () {
                        //登录返回
                        window.location.href = result.back_url || "${basePath}/";
                    }, 1000)
                }
            }, "json");

        });
        $('.page-container form .username, .page-container form .password').keyup(function () {
            $(this).parent().find('.error').fadeOut('fast');
        });
        //注册
        $("#register").click(function () {
            window.location.href = "register.shtml";
        });
    });
</script>
</body>

</html>

