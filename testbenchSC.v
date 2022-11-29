`timescale 1 ns / 100 ps
module testbench () ;
reg [7:0] tempA;
reg [3:0] pressaoA;
reg [11:0] radiacaoA;
wire alarme;
integer i , errors;

task Check;
input xpect;
    if ( alarme !== xpect ) begin
        $display (" Error : (temp = %3d, pressao = %d, rad = %5d), expect %b, got %b", tempA, pressaoA, radiacaoA, xpect , alarme );
        errors = errors + 1;
    end
endtask

salaDeControle UUT ( .temp( tempA ) , .pressao ( pressaoA ) , .radiacao( radiacaoA ) , .alarmeSonoroSC( alarme ) );

initial begin
    pressaoA = 0;
    radiacaoA = 0;
    errors = 0;
    for(i = 0; i <= 100; i = i + 2) begin
        tempA = i;
        if(tempA >= 40)
            Check(1);
        else Check(0);
    end
    tempA = 0;
    for(i = 0; i <= 15; i = i + 1) begin
        pressaoA = i;
        if(pressaoA >= 7)
            Check(1);
        else
            Check(0);
    end
    pressaoA = 0;
    for(i = 0; i <= 2000; i = i + 100) begin
        radiacaoA = i;
        if(radiacaoA >= 1000)
            Check(1);
        else
            Check(0);
    end
        $display("Tests Errors, %2d errors", errors);
end
endmodule
