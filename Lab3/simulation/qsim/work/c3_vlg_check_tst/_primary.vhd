library verilog;
use verilog.vl_types.all;
entity c3_vlg_check_tst is
    port(
        led             : in     vl_logic;
        \out\           : in     vl_logic_vector(3 downto 0);
        sampler_rx      : in     vl_logic
    );
end c3_vlg_check_tst;
