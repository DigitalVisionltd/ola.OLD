


<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr" lang="en-US">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="robots" content="noindex, nofollow, noarchive"/>
        <meta name="googlebot" content="noindex, nofollow, noarchive"/>
        <title>Όλα Πάτρα &raquo; Log in</title>
        <script type="text/javascript" src="https://www.olapatra.gr/ola/oc-includes/osclass/assets/js/jquery.min.js"></script>
        <link type="text/css" href="style/backoffice_login.css" media="screen" rel="stylesheet"/>
            </head>
    <body class="login">
        <div id="login">
            <h1>
                <a href="http://osclass.org/" title="Osclass">
                    <img src="https://www.olapatra.gr/ola/oc-admin/images/osclass-logo.gif" border="0" title="Osclass" alt="Osclass"/>
                </a>
            </h1>
                        <form name="loginform" id="loginform" action="https://www.olapatra.gr/ola/oc-admin/index.php" method="post"><input type='hidden' name='CSRFName' value='CSRF1572579679_1486537771' />
        <input type='hidden' name='CSRFToken' value='413eb13513b464667a228955ccf287dccd0d3029c45d840d8d8f4e332cb3baa890ce5a72129b66c1b32dbdd57b5f70bcc34838f399e6887d1fb9d674d99cdd27' />
                <input type="hidden" name="page" value="login"/>
                <input type="hidden" name="action" value="login_post"/>
                <p>
                    <label for="user_login">
                        <span>Username</span>
                        <input type="text" name="user" id="user_login" class="input" value="" size="20"/>
                    </label>
                </p>
                <p>
                    <label for="user_pass">
                        <span>Password</span>
                        <input type="password" name="password" id="user_pass" class="input" value="" size="20" autocomplete="off"/>
                    </label>
                </p>
                                                                    <p>
                        <select name="locale" id="user_language">
                                                    <option value="en_US" selected="selected">English</option>
                                                    <option value="el_GR" >Greek</option>
                                                </select>
                    </p>
                                <p class="forgetmenot">
                    <label>
                        <input name="remember" type="checkbox" id="remember" value="1"/> Remember me                    </label>
                        <a href="https://www.olapatra.gr/ola/oc-admin/index.php?page=login&amp;action=recover" title="Forgot your password?" class="forgot">Forgot your password?</a>
                </p>
                <p class="submit">
                    <input type="submit" name="submit" id="submit" value="Log in"/>
                </p>
            </form>

        </div>
        <p id="backtoblog"><a href="https://www.olapatra.gr/ola/" title="Back to Όλα Πάτρα">&larr; Back to Όλα Πάτρα</a></p>
        <script type="text/javascript">
            $(document).ready(function() {
                function placeholder(input_form) {
                    input_form.each(function() {
                        $(this).focus(function() {
                            $(this).prev().hide();
                        }).blur(function() {
                            if($(this).val() == '') {
                                $(this).prev().show();
                            }
                        }).prev().click(function() {
                            $(this).hide().next().focus();
                        });
                        if($(this).val() != '') {
                            $(this).prev().hide();
                        }
                    });
                }

                placeholder($('#user_login, #user_pass'));
                setTimeout(function() {
                    placeholder($('#user_login, #user_pass'));
                }, '500');

                $(".ico-close").click(function(){
                    $(this).parent().hide();
                });

                $("#user_login").focus();
            });
        </script>
    </body>
</html>
