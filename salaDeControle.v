module salaDeControle(temp, pressao, radiacao, alarmeSonoroSC);
    input [7:0] temp;
    input [3:0] pressao;
    input [11:0] radiacao;
    output reg alarmeSonoroSC;

    always @ (*)
        begin
            if(temp > 8'b00101000)
                alarmeSonoroSC = 1'b1;
            else if(pressao >= 4'b0111)
                alarmeSonoroSC = 1'b1;
            else if(radiacao >= 12'b001111101000)
                alarmeSonoroSC = 1'b1;
            else
                begin alarmeSonoroSC = 1'b0; end
        end
endmodule