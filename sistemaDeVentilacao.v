module sistemaDeVentilacao(sensPresSC, sensPresS1, sensPresS2, sensPresS3, sensPresTubSR, sensPresTubSS, sensPresRea, alarmeSonoroVentilacao, damperS12, damperS23, damperS3SS, damperS3SR, damperSSSC, damperRSR);
    input[3:0] sensPresSC, sensPresS1, sensPresS2, sensPresS3, sensPresTubSR, sensPresTubSS, sensPresRea;
    output reg alarmeSonoroVentilacao, damperS12, damperS23, damperS3SS, damperS3SR, damperSSSC, damperRSR;
    always @(*)
        begin
            alarmeSonoroVentilacao = 1'b0;
            damperS12 = 1'b0;
            damperS23 = 1'b0;
            damperS3SS = 1'b0;
            damperS3SR = 1'b0;
            damperSSSC = 1'b0;
            damperRSR = 1'b0;
            //Obs todas as pressões estao em complemento de 2
            if((sensPresRea > 4'b0111) && (sensPresTubSR > 4'b0111) && (sensPresRea < sensPresTubSR))
                begin damperRSR=1'b1; end
            else if((sensPresRea <= 4'b0111)||(sensPresTubSR <= 4'b0111))
                begin damperRSR=1'b1; end
            
            if((sensPresTubSR > 4'b0111)&&(sensPresS3 > 4'b0111) && (sensPresTubSR < sensPresS3))
                begin damperS3SR=1'b1; end
            else if((sensPresTubSR <= 4'b0111)||(sensPresS3 <= 4'b0111))
                begin damperS3SR=1'b1; end
            
            if((sensPresS3 > 4'b0111)&&(sensPresS2 > 4'b0111) && (sensPresS3 < sensPresS2))
                begin damperS23=1'b1; end
            else if((sensPresS3 <= 4'b0111)||(sensPresS2 <= 4'b0111))
                begin damperS23=1'b1; end
            
            if((sensPresS2 > 4'b0111)&&(sensPresS1 > 4'b0111) && (sensPresS2 < sensPresS1))
                begin damperS12=1'b1;end
            else if((sensPresS2 <= 4'b0111)||(sensPresS1 <= 4'b0111))
                begin damperS12=1'b1; end
                
            if((sensPresTubSS > 4'b0111)&&(sensPresS3 > 4'b0111) && (sensPresTubSS < sensPresS3))
                begin damperS3SS=1'b1; end
            else if((sensPresTubSS <= 4'b0111)||(sensPresS3 <= 4'b0111))
                begin damperS3SS = 1'b1; end
            
            if((sensPresSC > 4'b0111)&&(sensPresTubSS > 4'b0111) && (sensPresSC < sensPresTubSS))
                begin damperSSSC=1'b1; alarmeSonoroVentilacao=1'b1; end
            else if((sensPresSC <= 4'b0111)||(sensPresTubSS <= 4'b0111))
                begin damperSSSC=1'b1; alarmeSonoroVentilacao=1'b1; end
        end
endmodule