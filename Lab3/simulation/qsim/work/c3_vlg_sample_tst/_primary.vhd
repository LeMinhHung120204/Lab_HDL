library verilog;
use verilog.vl_types.all;
entity c3_vlg_sample_tst is
    port(
        clk_50          : in     vl_logic;
        clr             : in     vl_logic;
        \in\            : in     vl_logic_vector(2 downto 0);
        start           : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end c3_vlg_sample_tst;
