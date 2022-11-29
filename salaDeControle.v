module salaDeControle(temp, pressao, radiacao, alarmeSonoroSC);
    input [7:0] temp;
    input [3:0] pressao;
    input [11:0] radiacao;
    output reg alarmeSonoroSC;

    always @ (temp, pressao, radiacao)
        begin
            alarmeSonoroSC = 1'b0;
            // temperatura maior do que 40°C dentro da Sala de Controle
            if(temp >= 7'b0101000)
                alarmeSonoroSC = 1'b1;

            // pressao menor do que 0 atm (complemento de 2)
            if(pressao >= 4'b0111)
                alarmeSonoroSC = 1'b1;

            // radiacao maior do que 1000 mSv
            if(radiacao >= 12'b001111101000)
                alarmeSonoroSC = 1'b1;
        end
endmodule