module sistemaDeContoleDeTemperatura(sensTempSC, sensTempS1, sensTempS2, sensTempS3, sensTempTubSR, sensTempTubSS, sensTempRea, alarmeSonoroTemperatura);
    input [7:0] sensTempSC, sensTempS1, sensTempS2, sensTempS3, sensTempTubSR, sensTempTubSS;
    input [8:0] sensTempRea;
    output alarmeSonoroTemperatura;
    
    always @ (*)
        begin
        //sensor da Sala de Controle ativa se estiver acima de 50°C, do reator acima de 300°C e dos demais sensores acima de 100°C
            if((sensTempSC >=8'b00110010) || (sensTempS1 >=8'b01100100) || (sensTempS2 >=8'b01100100) || (sensTempS3 >=8'b01100100) || (sensTempTubSR >=8'b01100100) || (sensTempTubSS >=8'b01100100) || (sensTempRea >=9'b100000101))
                alarmeSonoroTemperatura = 1'b1;
        end
endmodule