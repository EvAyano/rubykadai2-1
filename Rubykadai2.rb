#プレイヤーの出す手を取得する
def gets_player_hand
    print "最初はグー！じゃんけん...\n"
    puts "[0]グー\n[1]チョキ\n[2]パー\n(数字を選んでください)"
    player_hand = gets.chomp.to_i
    until [0, 1, 2].include?(player_hand)
        puts "0から2の数字を入力してください。"
        print "数字を入力してください: "
        player_hand = gets.chomp.to_i
    end
    #0,1,2以外の数字が選ばれない場合ループ
    return player_hand
end

#プログラムの出す手を取得する
def gets_program_hand
    program_hand = rand(3)
    return program_hand
end
#それぞれが出した手を表示
def show_jyanken_result(player_hand, program_hand)
    hands = ["グー", "チョキ","パー"]
    puts "あなたの手:#{hands[player_hand]}, 相手の手:#{hands[program_hand]}"
end


#じゃんけんの勝敗を決める
def jyanken_judgement(player_hand, program_hand)
    while player_hand == program_hand
        puts "あいこです。もう一度。"
        player_hand=gets_player_hand()
        program_hand=gets_program_hand()
        show_jyanken_result(player_hand, program_hand)
    end
    #じゃんけんwon
    if (player_hand == 0 && program_hand == 1)||(player_hand == 1 && program_hand == 2)||(player_hand == 2 && program_hand == 0)
        print"どちらを指しますか\n"
        return true
    #じゃんけんlost
    else
        print"どちらを向きますか\n"
        return false
    end
end

#プレイヤーの方向を取得
def gets_player_direction
    puts "[0]上\n[1]下\n[2]左\n[3]右\n(数字を選んでください)"
        player_direction = gets.chomp.to_i
        until [0, 1, 2, 3].include?(player_direction)
            puts "0から3の数字を入力してください。"
            print "数字を入力してください: "
            player_direction = gets.chomp.to_i
        end
    return player_direction
end
#プログラムの方向を取得
def gets_program_direction
    program_direction = rand (4)
    return program_direction
end
#お互いの方向を表示
def show_direction_result(player_direction,program_direction)
    directions = ["上", "下", "左", "右"]
    puts "あっち向いてホイ！\nあなたの方向:#{directions[player_direction]}, 相手の方向:#{directions[program_direction]}"
end

def direction_judgement(player_direction,program_direction, is_player_winner)
    #じゃんけんの勝者がプレイヤーであり、プレイヤーの指差した方向がプログラムと同じならば勝利
    if is_player_winner == true && player_direction == program_direction
        print "あなたの勝ちです。"
    #じゃんけんの勝者がプログラムであり、プレイヤーが向いた方向とプログラムの差した方向が同じならば負け
    elsif is_player_winner == false && player_direction == program_direction
        print "あなたの負けです。"
    #じゃんけんの勝者がどちらであろうと、指差した方向と向いた方向が異なれば引き分け。じゃんけんに戻る
    else
        print "引き分けです。もう一度初めからやり直します。\n"
        is_player_winner = jyanken_game()#修正/is_player_winnerの新しい数値を得る/
        player_direction=gets_player_direction()
        program_direction=gets_program_direction()
        show_direction_result(player_direction, program_direction)
        while (is_player_winner == true && player_direction != program_direction)||(is_player_winner == false && player_direction != program_direction)
        print "引き分けです。もう一度初めからやり直します。\n"
        is_player_winner = jyanken_game()
        player_direction=gets_player_direction()
        program_direction=gets_program_direction()
        show_direction_result(player_direction, program_direction)
        end
        if is_player_winner == true && player_direction == program_direction
            print "あなたの勝ちです。"
        elsif is_player_winner == false && player_direction == program_direction
            print "あなたの負けです。"
        end
    end
end







def jyanken_game
    player_hand=gets_player_hand()
    program_hand=gets_program_hand()
    show_jyanken_result(player_hand, program_hand)
    is_player_winner=jyanken_judgement(player_hand, program_hand)
    return is_player_winner
end


def direction_game(is_player_winner)
    player_direction=gets_player_direction()
    program_direction=gets_program_direction()
    show_direction_result(player_direction, program_direction)
    direction_judgement(player_direction, program_direction, is_player_winner)
end

is_player_winner=jyanken_game()

direction_game(is_player_winner)


