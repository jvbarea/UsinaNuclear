module UsinaNuclear (reset, CLOCK, sensPresSC, sensPresS1, sensPresS2, sensPresS3, sensPresTubSR, sensPresTubSS, sensPresRea, sensTempSC, sensTempS1, sensTempS2, sensTempS3, sensTempTubSR, sensTempTubSS, sensTempRea, sensorRadiacaoSC, damperS12, damperS23, damperS3SS, damperS3SR, damperSSSC, damperRSR, portasDeConcreto,  sistemaDeResfriamento, alarmeSonoro);
    reg reset, CLOCK;
    input [3:0] sensPresSC, sensPresS1, sensPresS2, sensPresS3, sensPresTubSR, sensPresTubSS, sensPresRea;
    input [7:0] sensTempS1, sensTempS2, sensTempS3, sensTempTubSR, sensTempTubSS, sensTempRea;
    input [8:0] sensTempSC;
    output reg damperS12, damperS23, damperS3SS, damperS3SR, damperSSSC, damperRSR, portasDeConcreto, sistemaDeResfriamento, alarmeSonoro;
    wire alarmeSonoroReator, alarmeSonoroTemperatura, alarmeSonoroVentilacao, alarmeSonoroSC;

    always@(posedge CLOCK)
        sistemaDeVentilacao SV(sensPresSC, sensPresS1, sensPresS2, sensPresS3, sensPresTubSR, sensPresTubSS, sensPresRea, alarmeSonoroVentilacao);
        sistemaDeContoleDeTemperatura ST(sensTempSC, sensTempS1, sensTempS2, sensTempS3, sensTempTubSR, sensTempTubSS, sensTempRea, alarmeSonoroTemperatura);
        salaDeControle SC(sensTempSC, sensPresSC, sensorRadiacaoSC, alarmeSonoroSC);
        sistemaDoReator SR (reset, CLOCK, sensTempRea, sensTempRea, portasDeConcreto, sistemaDeResfriamento, alarmeSonoroReator);
        alarmeSonoro = alarmeSonoroVentilacao or alarmeSonoroTemperatura or alarmeSonoroSC or alarmeSonoroReator;
endmodule