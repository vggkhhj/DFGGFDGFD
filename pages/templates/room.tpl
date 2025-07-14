
<div class="dark_fon orange_text orange_border" align=center style='position: fixed; z-index: 1000; right:0px; bottom: 0px; width:400px; height:500px;display:none;' id=chat_window>
    <div id='chat_title' style='width:100%; background: #e5e5e5; font-size: 20px; cursor: move'>
        ЧАТ
        <div style='float:right'><a href='#' id='close_chat'><i class="fa fa-window-close"></i></a>&nbsp;&nbsp;</div>
    </div>

    <div id='chat'>
        <h4>За ссылки - пожизненный бан!</h4>

        <script type="text/javascript" src="//vk.com/js/api/openapi.js?146"></script>
        <script type="text/javascript"> VK.init({apiId: IDyourGroup, onlyWidgets: true}); </script>
        <div id="vk_comments"></div>


        <script type="text/javascript">
            VK.Widgets.Comments("vk_comments", {limit: 10, attach: "*", mini: '1', height : 500, attach: false}, "ROOM");
        </script>
    </div>
</div>

<script>
    $(function() {
        $('#chat_window').draggable({cursor: "move" ,  handle: "#chat_title" });
        $('#chat_button').click(function() {
            $('#chat_window').slideDown();
            return false;
        } );
        $('#close_chat').click(function() {
            $('#chat_window').slideUp();
            return false;
        } );
    });
</script>

<div class="col-md-12 col-md-offset-0 dark_fon orange_text" id='choose_room' align=center style='margin-bottom: 10px;margin-top: -10px;'>
    <!--
    <a href='/?room=1'><div class='room_div  active_room'><div>КОМНАТА 1</div><div id='div_room_players_1' class='rooms_small_text' style='display: none;'>Игроков: <span id='room_players_1'></span> </div><div id='div_room_prize_1' class='rooms_small_text' style='display: none;'>Приз: <span id='room_prize_1'></span> </div><div id='div_room_wait_1' style='display: none;'> <img src='/img/wait.gif' style='width: 35px;'/> </div></div></a><a href='/?room=2'><div class='room_div '><div>КОМНАТА 2</div><div id='div_room_players_2' class='rooms_small_text' style='display: none;'>Игроков: <span id='room_players_2'></span> </div><div id='div_room_prize_2' class='rooms_small_text' style='display: none;'>Приз: <span id='room_prize_2'></span> </div><div id='div_room_wait_2' style='display: none;'> <img src='/img/wait.gif' style='width: 35px;'/> </div></div></a><a href='/?room=3'><div class='room_div '><div>КОМНАТА 3</div><div id='div_room_players_3' class='rooms_small_text' style='display: none;'>Игроков: <span id='room_players_3'></span> </div><div id='div_room_prize_3' class='rooms_small_text' style='display: none;'>Приз: <span id='room_prize_3'></span> </div><div id='div_room_wait_3' style='display: none;'> <img src='/img/wait.gif' style='width: 35px;'/> </div></div></a>		-->

</div>




<div class="col-md-12 col-md-offset-0 dark_fon orange_text" align=center>
    <h2>При регистрации БОНУС 2 РУБЛЯ!</h2>
</div>

	<div class="competitionBanner col-md-12 col-md-offset-0 dark_fon " align=center style='margin-top: 4px'>
			<h2><a href='http://fast-win.top/script.php' style='color: #fff'>Получить скрипт этого сайта можно просто так БЕСПЛАТНО!!!. !!!КЛИКНИ!!!</a></h2>
	</div>	



<div class="col-md-12 col-md-offset-0 dark_fon orange_text" id='prepare_finish' align=center style='display: none'>
    <h2>Подготовка розыгрыша....</h2>
</div>




<div class="col-md-12 col-md-offset-0" align=center style='padding-bottom: 15px; padding-top: 10px; position: relative; display:none;'id='box_for_anim' >
    <div id='indikator' style='width: 100%; height: 160px; background: #262729; position: relative; vertical-align:top'>
        <div id='winner_display' style='width: 100%; height: 160px; background: #262729; position: absolute; top: 0px; left: 0px; z-index: 10; display: none; color: white'>
            <div id='anim_part_1' align=center style='display:none;'>
                <h4>ВЫБОР ПОБЕДИТЕЛЯ...</h4>
                <div style='width: 500px; height: 120px; position: relative; overflow:hidden'>
                    <div style='height: 120px; width: 6000px; position: absolute;text-align:left' id='photos_div'></div>
                    <div style='width: 200px; height: 120px; position: absolute;'><img src='img/roulette_back.png'/></div>
                </div>

            </div>

            <div id='anim_part_2' align=center style='display:none;'>
                <h3>Победитель: <span id='winner_screen_name' class='orange_text' style='font-weight: bold'></span>
                    с шансом <span id='winner_pr' class='orange_text' style='font-weight: bold'></span></h3>

                <table>
                    <tr>
                        <td>
                            <img src='#' id='winner_photo' style='border-radius: 50%;' height=100/>

                        </td>
                        <td>&nbsp;&nbsp;</td>
                        <td class=''>
                            <h2></h2>
                            <h1 style='font-weight:bold'>Выигрыш: <span id='winner_sum' class='orange_text'></span></h1>
                            <h4 style='font-weight:bold'>Ставка: <span id='winner_stake' class='orange_text'></span></h4>
                        </td>
                    </tr>
                </table>

            </div>

        </div>

    </div>

</div>



<div class="col-md-12 col-md-offset-0 "  style='height: 7px; clear: both'>
</div>

<div class="row" style='padding-top: 5px;' align=top>

    <div class="col-md-12 col-md-offset-0">


        <div class="col-md-12 col-md-offset-0" id='bets_and_timer'>

            <div class="col-md-6 col-md-offset-0" align=center>
                <div class="dark_fon orange_border" >
                    <h2>СДЕЛАТЬ СТАВКУ:</h2>

                    <form action='#' method='post' id='betForm'>
                        <table>
                            <tr>
                                <td>
                                    <input type="text" placeholder="Сумма" class="form-control input-lg" style='width:100px; text-align:center' value='1' id='sum'/>
                                </td>
                                <td>&nbsp;&nbsp;&nbsp;</td>
                                <td>
                                    <input type="submit" class="btn btn-xlarge bet_button" name="login" value="СТАВКА" style='padding: 8px 25px;' "this.disabled=true;"/>
                                </td>
                            </tr>
                        </table>
                    </form>
                    <div style='height: 10px;'></div>
					<?php if(empty($user)){?>
                    <a href='/signin/'><button class='btn btn-Default btn-green' style='width:95%'><i class='fa fa-user-plus'></i> РЕГИСТРАЦИЯ/ВХОД</button></a>				<div style='height: 10px;'></div>
                    <?php }else{?>
						<span id='message'>&nbsp;</span>				<div style='height: 10px;'></div>
	                <?php }?>
	                <!--
                    Не делайте необдуманных ставок! <br/>
                    Сделанную ставку невозможно вернуть или отменить!
                    <br/>
                    <br/> -->
                </div>
            </div>


            <div class="col-md-6 col-md-offset-0">
                <div id='top_blocks'>
                    <div class="col-md-12 col-md-offset-0 "  style='height: 0px; clear: both'> </div>
                    <div class='col-md-12  dark_fon top_blocks' align=center>
                        ПРИЗ: <span style='font-weight: bold;' class='orange_text' id='prize'>...</span> руб.
                    </div>
                    <div class="col-md-12 col-md-offset-0 "  style='height: 20px; clear: both'> </div>
                    <div class='col-md-12  dark_fon top_blocks' align=center>
                        ДО КОНЦА: <span style='font-weight: bold;' class='orange_text' id='timer'>00:00</span>
                    </div>

                    <div class="col-md-12 col-md-offset-0 "  style='height: 7px; clear: both'> </div>
                </div>

                <div class="dark_fon orange_text" id='top_message' align=center style='margin:15px; display:none'>
                    <h2>Отсчет начнется после ставок двух игроков</h2>
                </div>


            </div>


        </div>

        <div class="col-md-12 col-md-offset-0 "  style='height: 7px; clear: both'> </div>


        <div class="col-md-12 col-md-offset-0 dark_fon row" align=left style='padding: 0px;'>
            <div style='padding: 3px; margin-top: 2px; margin-bottom: 32px'>
                <div id='vert_indicator' style='text-align:center'></div>

                <div style='width: 100%; height: 150px; text-align:center; top: 0px; left: 0px; z-index: 0; color: #ddd' id='wait_message'>
                    <h2> <br/>Ожидание участников...</h2>
                    <img src='img/wait2.gif'/>
				<center><div id="linkslot_4332"></div><script src="https://www.linkslot.su/bancode.php?id=4332" async></script></center>
                </div>
            </div>
        </div>
        



        <!--
                <div class="col-md-12 col-md-offset-0 dark_fon marg_pad" align=center>
                    Текущий раунд: #<span id='lot_id'>...</span>
                </div>
        -->

        <div class="col-md-6 col-md-offset-0 dark_fon marg_pad" align=center>
            <h3>ЗАВЕРШЕННЫЕ РАУНДЫ</h3>
            <br/>
            <table style='width: 100%;'>
                <tr style='font-size: 18px;' id='fl_tb_head'>
                    <td class='orange_text center_text'>#</td>
                    <td>&nbsp; &nbsp; &nbsp; &nbsp; УЧАСТНИК</td>
                    <td class='orange_text center_text'>ВЫИГРЫШ</td>
                    <td class='center_text'>ШАНС</td>
                    <td class='orange_text center_text'>СТАВКА</td>
                </tr>
            </table>
        </div>

        <div class="col-md-3 col-md-offset-0" align=center>
            <div class=' dark_fon marg_pad' style='margin-left: 3px;'>
                <h3>ПРИВЕТСТВУЕМ УЧАСТНИКОВ:</h3>
                <div id='new_users'></div>
            </div>
        </div>

        <div class="col-md-3 col-md-offset-0" align=center>
            <div class=' dark_fon marg_pad'>
                <h3>ПОСЛЕДНИЕ ВЫПЛАТЫ:</h3>
                <div id='last_payments'>

                </div>
            </div>
        </div>



    </div>








<script>
$(function() {



    var ROOM = '<?php echo $_GET['room']?>';
    var OWN_ID = 0;

    var mess_interval;
    function displayMessage(text, color) {
       // clearTimeout(mess_interval);

        $('#message').css('color', color);
        $('#message').html(text);
      //  mess_interval = setTimeout(function() { $('#message').html('&nbsp;'); }, 2000);
    }


    $( "#betForm" ).submit(function( event ) {
        event.preventDefault();

        s = $('#sum').val();
        displayMessage('Подождите....', 'white');
        $('#betForm').css('opacity', 0.3);

        $.ajax({
            url: '/back/bet/',
            type: "POST",
            data: { 'sum': s, 'room' : ROOM },
            dataType: 'json',
            cache: false,
            success: function(res) {
                if (res['error']=='need_auth') {
                    window.location = "/signin/";
                    return;
                }
                if (res['error']!=undefined) {
                    displayMessage('ОШИБКА: '+res['error'], '#ff6b80');
                }
                if (res['result'] =='OK') {
                    displayMessage('Ставка принята!', '#58ff7f');
                    $('.user_balance').each(function () { $(this).html(res['new_balance'])  } );
                };
                $('#betForm').css('opacity', 1);
            }, error: function(res) {
                $('#message').html( 'Запрос не удался. Попробуйте еще раз.' );
                $('#message').css('color', '#ff6b80');
            }
        });

    });


    time_to_show = 0;
    last_timer = 0;
    function tick() {
        time_to_show--;
        if (time_to_show < 0 ) time_to_show = 0;
        ttt = time_to_show;

        if (last_timer==1 && time_to_show==0) {
            $('#prepare_finish').fadeIn();

            /*if (top_blocks_visible) {
             top_blocks_visible = false;
             $('#top_blocks').slideUp();
             }*/
        }

        if (time_to_show > 5) {
            if (!top_blocks_visible) {
                top_blocks_visible = true;
                $('#top_blocks').fadeIn();
            }
        }


        last_timer = time_to_show;
        if (ttt > 0) {
            tsec=ttt%60; ttt=Math.floor(ttt/60); if(tsec<10)tsec='0'+tsec;
            tmin=ttt%60; ttt=Math.floor(ttt/60); if(tmin<10)tmin='0'+tmin;
            $('#timer').html(tmin+':'+tsec);
        } else {
            $('#timer').html('00:00');
        }

        if (time_to_show > 0 && time_to_show<=10) $('#timer').addClass('blink2');
        else $('#timer').removeClass('blink2');
    }
    setInterval(tick, 1000);

    us_colors = 4;
    us_cur_color = 1;
    top_message_visible = false;
    top_blocks_visible = true;

    busy = false;

    winner_animation = false;

    function start_winner_animation(user_data) {
        //alert('start_winner_animation');
        if (winner_animation) return;
        winner_animation = true;
        $('#winner_display').fadeIn();
        $('#anim_part_1').fadeIn();
        $('#box_for_anim').slideDown();
        $('#anim_part_2').css('display' , 'none');

        $('#message').html('');

        $('#prepare_finish').fadeOut();

        /*
         if (top_blocks_visible) {
         top_blocks_visible = false;
         $('#top_blocks').slideUp();
         }
         */

        $('#bets_and_timer').slideUp();

        //setTimeout(function() { $('#winner_top_text').html('ВЫБОР ПОБЕДИТЕЛЯ...') }, 1000);

        $('#photos_div').html('');

        user_to_take = new Array();
        for (user_id in users_arr) {
            user_to_take[user_to_take.length] = user_id;
            if (users_arr[user_id]['pr'] >=10) user_to_take[user_to_take.length] = user_id;
            if (users_arr[user_id]['pr'] >=20) user_to_take[user_to_take.length] = user_id;
            if (users_arr[user_id]['pr'] >=30) user_to_take[user_to_take.length] = user_id;
        }

        //alert(user_to_take);

        $( "#photos_div" ).css('left', 0);

        counter = 0;
        win_num = Math.round(Math.random()*10) + 30;
        for(i=1; i<=50; i++) {

            rand_user_id = Math.floor(Math.random() * (user_to_take.length-1));
            rand_user_id = user_to_take[rand_user_id];
            counter++;
            //	alert(users_arr[user_id]['photo']);
            if (counter!=win_num)
                $( "#photos_div" ).append( "<img src='"+users_arr[rand_user_id]['photo']+"' style='height: 100px; padding-top: 15px; padding-left: 1px;'/>" );
            else
                $( "#photos_div" ).append( "<img src='"+user_data['photo']+"' style='height: 100px; padding-top: 15px; padding-left: 1px;' id='winner_loto_photo'/>" );

        }

        setTimeout(function() {
            pos = $('#winner_loto_photo').position().left;
            pos -=200;
            $( "#photos_div" ).animate({left: (pos * (-1))}, 4000);
            // , "easeInOutBounce"

            setTimeout(function() {
                $('#anim_part_1').fadeOut();

                setTimeout(function() { $('#anim_part_2').fadeIn(); }, 500);

                $('#winner_photo').attr('src', user_data['photo']);
                $('#winner_stake').html(user_data['stake'] + ' руб.');
                $('#winner_sum').html(user_data['sum'] + ' руб.');
                $('#winner_pr').html(user_data['pr'] + '%');
                $('#winner_screen_name').html(user_data['screen_name']);

                reloadBalance();

            }, 6000);

            setTimeout(function() {
                $('#bets_and_timer').slideDown();
                $('.tooltip').remove();
                $('.user_right_box').remove();
                $('.del_after_finish').remove();
                $('#winner_display').fadeOut();
                $('#grey_zone').css('opacity', 0);
                winner_animation = false;
                $('#box_for_anim').slideUp();
                $('#wait_message').css('display', 'block');

                load_finished_lottery();

            }, 10000);



        }, 1000);



        return;


    }


    /*
     setTimeout(function() {
     ob = new Array();
     ob['photo'] = 'https://pp.userapi.com/c637227/v637227693/34ea6/PxWLKaN44G0.jpg';
     ob['stake'] = '12.33';
     ob['sum'] = '1050';
     ob['pr'] = '3.25';
     ob['screen_name'] = 'Имя Победителя';
     start_winner_animation(ob);
     }, 2000);
     */


    users_arr = new Array();
    tooltip_pos = 'bottom';

    last_kol = new Array();
    last_sum = new Array();
    last_new_user_id = 0;

    function toTop(el) { // поднять наверх
        el.remove().prependTo( $("#vert_indicator") );
    }

    function check() {
        if (busy) return;
        busy = true;
        $.ajax({
            //  url: '/cache/bets.cache',
            url: '/back/online/',
            dataType: 'json',
            cache: false,
            success: function(answer) {
                busy = false;
                if (answer['time'] == undefined) return;
                //var res = $.parseJSON(res);
	            if (answer['cancel']==1) {
		            displayMessage('Раунд отменен. Ставка возвращена.', '#ff6b80');
		            reloadBalance();
		            $("#vert_indicator").html('');
		            setTimeout(function(){
			            displayMessage('', '#ff6b80');
		            },4000);
	            }

                $('#list_text').html('');

                res = answer['ROOMS'][ROOM];

                $('#prize').html(res['sum']);
                if (res['sum'] == null) $('#prize').html('---');

                $('#lot_id').html(res['lot_id']);

                time_to_show = parseInt( res['finish'] ) - parseInt( answer['time'] );

                // индикаторы вверху
                for (room_id in answer['ROOMS']) {
                    users_kol = parseInt(answer['ROOMS'][room_id]['total_users']);
                    sum = parseInt(answer['ROOMS'][room_id]['sum']);
                    if (users_kol>=1) {
                        $('#div_room_wait_'+room_id).css('display', 'none');
                        $('#div_room_players_'+room_id).css('display', 'block');
                        $('#div_room_prize_'+room_id).css('display', 'block');
                        $('#room_players_'+room_id).html(users_kol);
                        $('#room_prize_'+room_id).html( sum+' руб.' );

                        if (last_kol[room_id] != users_kol)
                            $('#div_room_players_'+room_id).animate({color: 'white'}, 100).animate({color: '#ec9204'}, 100).animate({color: 'white'}, 100).animate({color: '#ec9204'}, 100).animate({color: 'white'}, 100);

                        if (last_sum[room_id] != sum)
                            $('#div_room_prize_'+room_id).animate({color: 'white'}, 100).animate({color: '#ec9204'}, 100).animate({color: 'white'}, 100).animate({color: '#ec9204'}, 100).animate({color: 'white'}, 100);



                        last_kol[room_id] = users_kol;
                        last_sum[room_id] = sum;

                    } else {
                        $('#div_room_wait_'+room_id).css('display', 'block');
                        $('#div_room_players_'+room_id).css('display', 'none');
                        $('#div_room_prize_'+room_id).css('display', 'none');
                    }
                }

                // приветствуем учасников
                for (us_id in answer['new_users']) {
                    if (parseInt(us_id) <= last_new_user_id) continue;
                    last_new_user_id = us_id;
                    _d = answer['new_users'][us_id];
                    str = "<div class='new_user' id='nu_id_"+us_id+"' style='display:none;clear:both; padding-top:7px; border-bottom: 2px solid #ffba00;'>";
                    str += '<table><tr>';
                    str += '<td><a href="https://vk.com/id'+_d['vk_id']+'" target=_blank><img src="'+_d['photo']+'" /></a></td>';
                    str += '<td style="padding-left: 10px; font-size: 18px; color: white; width: 150px;">';
                    str += '<a href="https://vk.com/id'+_d['vk_id']+'" target=_blank style="color:white">'+_d['first_name']+'<br/>'+_d['last_name']+'</a>';
                    str += '</td>';
                    str += '</tr></table>';
                    str += '</div>';
                    $('#new_users').prepend( str );
                    if (first) $("#nu_id_"+us_id).css( 'display', 'block' );
                    else $("#nu_id_"+us_id).slideDown( 800 );
                    if ($(".new_user").length > 10) $( $(".new_user")[ $(".new_user").length - 1 ] ).remove();
                }


                if (winner_animation) return; // если идет анимация- ничего не добавляем

                changes = false;
                users_count = 0;

                users_arr = res['users'];

                grey_zone_width = 0;

                max_pr = 0;
                for (user_id in res['users']) {
                    pr = Math.round(res['users'][user_id]['pr']);
                    if (max_pr < pr) {
                        max_pr = pr; // ищем Макс процент
                        max_user_id = user_id;
                    }
                }

                sum_pr = 0;
                for (user_id in res['users']) { // перебор пользователей
                    users_count++;
                    us_div = $('#us_'+user_id);
                    //alert( us_div.length );
                    us_data = res['users'][user_id];
                    pr = Math.floor(us_data['pr']);
                    new_div = false;
                    if(us_div.length == 0) {
                        p = us_data['screen_name'].split(' ');
                        str = "<div id='us_"+user_id+"' class='del_after_finish user_ind_box us_color_"+us_cur_color+"' pr='"+pr+"' sum='"+us_data['sum']+"' screen_name='"+us_data['screen_name']+"'>";
                        str += "<div style='height:75px; margin-top: 7px;'>";
                        str += "<table style='height:100%; width:100%' > <tr><td style='vertical-align:middle'>";
                        str += "<img src='"+us_data['photo']+"' style='margin: auto;'/>";
                        str += "</td></tr></table>";
                        str += "</div>";
                        // str += "<div><span id=scr_name>"+us_data['screen_name']+"</span></div>";
                        //str += "<div><span id=scr_name>"+p[0]+"</span></div>";
                        //str += "<div><span id=scr_name>"+p[1]+"</span></div>";
                        str += "<div class='abs_w_100' style='top: 85px;'><span id=us_sum>"+us_data['sum']+" р.</span></div>";
                        str += "<div class='abs_w_100' style='top: 115px; text-align:center' ><div id=us_pr>"+us_data['pr']+"%</div></div>";
                        str += "<div class='abs_w_100' style='top: 143px;'><span id=us_screen_name><nobr>"+us_data['screen_name']+"</nobr></span></div>";
                        str += "</div>";
                        //alert(str);
                        $( "#vert_indicator" ).append( str );
                        us_cur_color++;
                        if (us_cur_color>us_colors) us_cur_color = 1;
                        us_div = $('#us_'+user_id);

                        //$(us_div).css('display', 'none');
                        //$(us_div).fadeIn('slow');

                        tip_text = '<span style="font-size:13px;"><b>'+$(us_div).attr('screen_name')+"</b></span>";
                        //tip_text = '<span style="font-size:13px;">'+us_data['screen_name']+"</span> <br/><b> "+us_data['pr']+"%</b>";
                        $(us_div).attr('data-title', tip_text );
                        $(us_div).attr('data-original-title', tip_text);
                        $(us_div).attr('data-placement',  "bottom");
                        $(us_div).attr('data-delay',  '0');
                        $(us_div).attr('data-html',  'true');


                        $( us_div ).tooltip();

                        new_div = true;

                    }


                    //$( us_div ).mouseenter();

                    //us_div.css('width', Math.floor(pr)+'%');
                    /*
                     if (parseFloat( us_data['pr'] ) <8) {
                     us_div.children().each(function() {$(this).css('opacity', '0'); } );
                     grey_zone_width += us_data['pr'];
                     $(us_div).find('#us_sum').html("&nbsp;");
                     $(us_div).find('#us_pr').html("&nbsp;");


                     us_div.removeAttr('data-title');


                     //$( us_div ).tooltip({ content:  us_data['screen_name']+" \n"+us_data['pr']+"%" }, {}  );

                     //$( us_div ).mouseenter();

                     } else {
                     us_div.css('display', 'inline-block');
                     us_div.children().each(function() {$(this).css('opacity', '1'); } );

                     $(us_div).find('#us_sum').html(us_data['sum']+" ?");
                     $(us_div).find('#us_pr').html(us_data['pr']+"%");

                     us_div.removeAttr('data-title');
                     }*/


                    //$(us_div).find('#us_sum').html( $(us_div).width() );

                    us_div.css('width', (pr)+'%');

                    if ($(us_div).width() < 80) {
                        $(us_div).addClass('mini_user_block');
                    } else  {
                        $(us_div).removeClass('mini_user_block');
                    }

                    if ($(us_div).width() < 100) {
                        $(us_div).find('#us_screen_name').css('display', 'none');
                    } else  {
                        $(us_div).find('#us_screen_name').css('display', 'block');
                    }

                    $(us_div).find('#us_sum').html(us_data['sum']+" р.");
                    $(us_div).find('#us_pr').html(us_data['pr']+"%");
                    if (parseFloat( us_data['pr'] ) > parseFloat( us_div.attr('pr') )  && !new_div) {
                        // us_div.animate({width: Math.floor(pr)+'%'}, 500);
                        // надо помигать
                        us_div.animate({opacity: '0.5'}, 100).animate({opacity: '1'}, 100);
                        us_div.animate({opacity: '0.5'}, 100).animate({opacity: '1'}, 100);

                    }

                    us_div.attr('sum',  us_data['sum']);
                    us_div.attr('pr',  us_data['pr']);
                    //us_div.attr('title',  us_data['screen_name']+': '+us_data['pr']+"%");

                    if (new_div) {
                        $(us_div).css('display', 'none');
                        $(us_div).fadeIn('slow');
                    }




                    sum_pr += (pr);
                }


                //$('#sum').val(sum_pr);
                last_space = 100 - sum_pr-2;
                last_space = Math.floor(last_space);
                if (last_space > 0) $('#us_'+max_user_id).css('width', (parseFloat($('#us_'+max_user_id).attr('pr'))+last_space)+'%');

                //$('#sum').val(sum_pr+' '+last_space);


                // анимация победителя
                if (res['has_winner'] == 'yes' && !winner_animation) {
                    start_winner_animation(res['winner']);
                    return;
                }



                /*
                 if (grey_zone_width > 1) grey_zone_width -= 1;
                 $('#grey_zone').css('width', grey_zone_width+'%');
                 $('#grey_zone').css('opacity', 1);
                 */

                if (users_count <= 1 && !winner_animation) {
                    $('#list_text').html('Ожидание участников...');
                    $('#wait_message').css('display', 'block');

                    if (top_blocks_visible) {
                        top_blocks_visible = false;
                        $('#top_blocks').fadeOut();
                    }
                    if (!top_message_visible) {
                        $('#top_message').fadeIn();
                        top_message_visible = true;
                    }
                }
                if (users_count >=2 && top_message_visible) {
                    $('#top_message').fadeOut();
                    top_message_visible = false;

                }

                if (users_count >=2 && !top_blocks_visible) {
                    top_blocks_visible = true;
                    $('#top_blocks').fadeIn();
                }


                if (users_count > 0) $('#wait_message').css('display', 'none');
                first = false;

            }, error: function(res) {
                busy = false;
            }
        });


    }



    check();
    setInterval(check, 2000);

    first = true;


    function reloadBalance() {
        $.ajax({
            url: '/back/balance/',
            cache: false,
            success: function(res) {
                if (res != '') {
                    $('.user_balance').each(function () { $(this).html(res)  } );
                }
            }
        });
    }



    load_finished_lottery_busy = false;
    fl_last_id = 0;

    function load_finished_lottery() {
        if (load_finished_lottery_busy) return;
        load_finished_lottery_busy = true;

        $.ajax({
            url: '/back/finished/?room='+ROOM,
            //url: '/CRON/finish_online.php?room='+ROOM,
            dataType: 'json',
            cache: false,
            success: function(res) {
                //  alert(435);
                load_finished_lottery_busy = false;

                for (key in res) { // перебор tr`ов
                    if (parseFloat(key) <= fl_last_id) continue;
                    fl_last_id = parseFloat(key);

                    str = "<tr class='user_row' id='fl_id_"+key+"' style='display:none'>";
                    str += "<td class='orange_text center_text round_id'>"+key+"</td> ";
                    if (ROOM==1) {
                        str += '<td><a href="https://vk.com/id'+res[key]['vk_id']+'" target=_blank style="color:white">';
                        str += '<img src="'+res[key]['photo']+'" class=table_avatar /></a> &nbsp; ';
                        str += '<a href="https://vk.com/id'+res[key]['vk_id']+'" target=_blank style="color:white"><span style="font-size: 17px;">'+res[key]["screen_name"]+"</span></a></td> ";
                    }
                    else str += "<td><img src='"+res[key]['photo']+"' class='table_avatar'/> &nbsp; <span style='font-size: 17px;'>"+res[key]['screen_name']+"</span></td> ";
                    str += "<td class='orange_text center_text round_id'>"+res[key]['sum']+" р.</td> ";
                    str += "<td class='center_text'>"+res[key]['pr']+"%</td> ";
                    str += "<td class='orange_text center_text round_id'>"+res[key]['stake']+" р.</td> ";
                    str += "</tr>";

                    $(str).insertAfter( "#fl_tb_head" );

                    if ($("tr.user_row").length > 25) $( $("tr.html")[ $("tr.html").length - 1 ] ).remove();
                    $("#fl_id_"+key).fadeIn( 800 );
                    // show('htt_new_'+res['data'][key]['id']);
                }

            }, error: function(res) {
                load_finished_lottery_busy = false;
            }
        });

    }
    load_finished_lottery();
    // setInterval(load_finished_lottery, 15000);




    load_last_payments_busy = false;
    paym_last_id = 0;

    function load_last_payments() {
        if (load_last_payments_busy) return;
        load_last_payments_busy = true;

        $.ajax({
            url: '/back/payments/',
            dataType: 'json',
            cache: false,
            success: function(res) {
                //  alert(435);
                load_last_payments_busy = false;

                // приветствуем учасников
                for (us_id in res) {
                    if (parseInt(us_id) <= paym_last_id) continue;
                    paym_last_id = us_id;
                    _d = res[us_id];
                    str = "<div class='last_pay' id='lp_id_"+us_id+"' style='display:none;clear:both; padding-top:7px; border-bottom: 2px solid #ffba00;'>";
                    str += '<table><tr>';
                    str += '<td><a href="https://vk.com/id'+_d['vk_id']+'" target=_blank><img src="'+_d['photo']+'" /></a></td>';
                    str += '<td style="padding-left: 10px; font-size: 14px; color: white; width: 150px;">';
                    str += '<a href="https://vk.com/id'+_d['vk_id']+'" target=_blank style="color:white">'+_d['screen_name']+'</a>';
                    str += '<div style="padding-top:5px; color: #ffba00; font-size: 18px;"><img src="/'+_d['img']+'" style="width:24px;" /> <b>'+_d['sum']+' РУБ.</b></div>';
                    str += '<div style="padding-top:1px;"><!--'+_d['p']+'--></div>';
                    str += '</td>';
                    str += '</tr></table>';
                    str += '</div>';
                    $('#last_payments').prepend( str );
                    if (first) $("#lp_id_"+us_id).css( 'display', 'block' );
                    else $("#lp_id_"+us_id).slideDown( 800 );
                    if ($(".last_pay").length > 10) $( $(".last_pay")[ $(".last_pay").length - 1 ] ).remove();
                }

            }, error: function(res) {
                load_finished_lottery_busy = false;
            }
        });

    }
    load_last_payments();
    setInterval(load_last_payments, 60000);



});
</script>








<div style='clear:both'></div>
<br/>




