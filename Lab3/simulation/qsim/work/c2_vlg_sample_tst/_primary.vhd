library verilog;
use verilog.vl_types.all;
entity c2_vlg_sample_tst is
    port(
        clk_50          : in     vl_logic;
        clr             : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end c2_vlg_sample_tst;
