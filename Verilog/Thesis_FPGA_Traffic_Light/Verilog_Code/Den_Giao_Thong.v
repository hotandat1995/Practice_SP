
module Den_Giao_Thong
(
    /*AUTOARG*/
    // Outputs
    street_a,
    street_a_pri_lamp,
    street_b,
    street_b_pri_lamp,
    // Inputs
    rst_n,
    clk
);

    // Interface //
    /* AUTO INPUT */
    // Beginning of automatic inputs (from unused autoinst inputs)
    input           clk;                // To cnt of time_counter.v, ...
    input           rst_n;              // To cnt of time_counter.v, ...
    // End of automatics

    /*AUTO OUTPUT*/
    // Beginning of automatic outputs (from unused autoinst outputs)
    output [2:0]    street_a;           // From fsm of fsm.v
    output [2:0]    street_b;           // From fsm of fsm.v
    output          street_a_pri_lamp;
    output          street_b_pri_lamp;
    // End of automatics

    /*AUTO WIRE*/
    // Beginning of automatic wires (for undeclared instantiated-module outputs)
    wire            fsm_g;              // From fsm of fsm.v
    wire            fsm_r;              // From fsm of fsm.v
    wire            fsm_y;              // From fsm of fsm.v
    wire            g_end;              // From cnt of time_counter.v
    wire            r_end;              // From cnt of time_counter.v
    wire            y_end;              // From cnt of time_counter.v
    // End of automatics

    time_counter cnt
    (
        /*AUTO INST*/
        // Outputs
        .g_end        (g_end),
        .y_end        (y_end),
        .r_end        (r_end),
        // Inputs
        .clk          (clk),
        .rst_n        (rst_n),
        .fsm_g        (fsm_g),
        .fsm_r        (fsm_r),
        .fsm_y        (fsm_y)
    );

    fsm fsm
    (
        /*AUTO INST*/
        // Outputs
        .street_a           (street_a[2:0]),
        .street_a_pri_lamp  (street_a_pri_lamp),
        .street_b           (street_b[2:0]),
        .street_b_pri_lamp  (street_b_pri_lamp),
        .fsm_g              (fsm_g),
        .fsm_y              (fsm_y),
        .fsm_r              (fsm_r),
        // Inputs
        .clk                (clk),
        .rst_n              (rst_n),
        .g_end              (g_end),
        .y_end              (y_end),
        .r_end              (r_end)
    );

endmodule
