`timescale 1 ns / 100 ps
module testbench () ;
reg [7:0] tempSC, tempS1, tempS2, tempS3, tempTubSR, tempTubSS;
reg [8:0] tempRea;
wire alarme;
integer i , errors;

task Check;
input xpect;
    if ( alarme !== xpect ) begin
        $display (" Error : expect %b, got %b", xpect , alarme );
        errors = errors + 1;
end
endtask

sistemaDeContoleDeTemperatura UUT ( .sensTempSC(tempSC), .sensTempS1(tempS1), .sensTempS2(tempS2), .sensTempS3(tempS3), .sensTempTubSR(tempTubSR), .sensTempTubSS(tempTubSS), .sensTempRea(tempRea), .alarmeSonoroTemperatura(alarme));

initial begin
    errors = 0;
    for(i = 0; i < 400; i = i + 1)
    begin
        if(i < 200)
        begin
            i = tempSC;
            if(tempSC >= 40)
                Check(1);
            else
            Check(0);
            i = tempS1;
            if(tempS1 >= 100)
                Check(1);
            else
                Check(0);
            i = tempS2;
            if(tempS2 >= 100)
                Check(1);
            else
                Check(0);
            i = tempS3;
            if(tempS3 >= 100)
                Check(1);
            else
                Check(0);
            i = tempTubSR;
            if(tempTubSR >= 100)
                Check(1);
            else
                Check(0);
            i = tempTubSS;
            if(tempTubSS >= 100)
                Check(1);
            else
                Check(0);
        end
        tempRea = i;
        if(tempRea >= 300)
            Check(1);
        else
            Check(0);
    end
    $display("Tests Errors, %2d errors", errors);
end
endmodule