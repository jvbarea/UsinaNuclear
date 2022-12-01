`timescale 1 ns / 100 ps
module testbench ();
reg [3:0] presSC, presS1, presS2, presS3, presTubSR, presTubSS, presRea;
wire alarme, damperS12A, damperS23A, damperS3SSA, damperS3SRA, damperSSSCA, damperRSRA;
integer i, errors;

task CheckAlarm;
input xpect;
    if ( alarme !== xpect ) begin
        $display (" Error : expect %b, got %b", xpect , alarme );
        errors = errors + 1;
end
endtask

sistemaDeVentilacao UUT ( .sensPresSC(presSC), .sensPresS1(presS1), .sensPresS2(presS2), .sensPresS3(presS3), .sensPresTubSR(presTubSR), .sensPresTubSS(presTubSS), .sensPresRea(presRea), .alarmeSonoroVentilacao(alarme), .damperS12(damperS12A), .damperS23(damperS23A), .damperS3SS(damperS3SSA), .damperS3SR(damperS3SRA), .damperSSSC(damperSSSCA), .damperRSR(damperRSRA) );

initial
begin
    presRea = -1;
    presTubSR = -2;
    $write("DumberSRSR: %2d Ativado? ", damperRSRA);
    if (damperRSRA==1) $display ("Sim");
    else if (damperRSRA==0) $display("Nao");
    else $display("Not sure");
    presRea = -2;
    presTubSR = -1;
    $write("DumberSRSR: %2d Ativado? ", damperRSRA);
    if (damperRSRA==1) $display ("Sim");
    else if (damperRSRA==0) $display("Nao");
    else $display("Not sure");

    presTubSR = -1;
    presS3 = -2;
    $write("DumberS3SR: %2d Ativado? ", damperS3SRA);
    if ( damperS3SRA==1) $display ("Sim");
    else if ( damperS3SRA==0) $display("Nao");
    else $display("Not sure");
    presTubSR = -2;
    presS3 = -1;
    $write("DumberS3SR: %2d Ativado? ", damperS3SRA);
    if ( damperS3SRA==1) $display ("Sim");
    else if ( damperS3SRA==0) $display("Nao");
    else $display("Not sure");

    presS3 = -1;
    presS2 = -2;
    $write("DumberS23: %2d Ativado? ", damperS23A);
    if ( damperS23A==1) $display ("Sim");
    else if ( damperS23A==0) $display("Nao");
    else $display("Not sure");
    presS3 = -2;
    presS2 = -1;
    $write("DumberS23: %2d Ativado? ", damperS23A);
    if ( damperS23A==1) $display ("Sim");
    else if ( damperS23A==0) $display("Nao");
    else $display("Not sure");

    presS2 = -1;
    presS1 = -2;
    $write("DumberS12: %2d Ativado? ", damperS12A);
    if ( damperS12A==1) $display ("Sim");
    else if ( damperS12A==0) $display("Nao");
    else $display("Not sure");
    presS2 = -2;
    presS1 = -1;
    $write("DumberS12: %2d Ativado? ", damperS12A);
    if ( damperS12A==1) $display ("Sim");
    else if ( damperS12A==0) $display("Nao");
    else $display("Not sure");

    presS2 = -1;
    presS1 = -2;
    $write("DumberS3SS: %2d Ativado? ", damperS3SSA);
    if (damperS3SSA==1) $display ("Sim");
    else if (damperS3SSA==0) $display("Nao");
    else $display("Not sure");
    presS2 = -2;
    presS1 = -1;
    $write("DumberS3SS: %2d Ativado? ", damperS3SSA);
    if (damperS3SSA==1) $display ("Sim");
    else if (damperS3SSA==0) $display("Nao");
    else $display("Not sure");

    presS2 = -1;
    presS1 = -2;
    $write("DumberSSSC: %2d Ativado? ", damperSSSCA);
    if (damperSSSCA==1) $display ("Sim");
    else if (damperSSSCA==0) $display("Nao");
    else $display("Not sure");
    presS2 = -2;
    presS1 = -1;
    $write("DumberSSSC: %2d Ativado? ", damperSSSCA);
    if (damperSSSCA==1) $display ("Sim");
    else if (damperSSSCA==0) $display("Nao");
    else $display("Not sure");
end
endmodule