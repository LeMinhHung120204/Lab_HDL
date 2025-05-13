library verilog;
use verilog.vl_types.all;
entity c2_vlg_check_tst is
    port(
        HEX0            : in     vl_logic_vector(6 downto 0);
        greenEW         : in     vl_logic;
        greenNS         : in     vl_logic;
        \out\           : in     vl_logic_vector(2 downto 0);
        redEW           : in     vl_logic;
        redNS           : in     vl_logic;
        yellowEW        : in     vl_logic;
        yellowNS        : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end c2_vlg_check_tst;
