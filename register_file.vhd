----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.12.2022 14:01:28
-- Design Name: 
-- Module Name: register_file - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

use work.mux_out_register_file_types.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity register_file is
    Port ( clk : in STD_LOGIC;
           we : in STD_LOGIC;
           addr_in : in STD_LOGIC_VECTOR (8 downto 0);
           data_in : in STD_LOGIC_VECTOR (7 downto 0);
           data_out : out STD_LOGIC_VECTOR (7 downto 0);
           value_from_stack : in STD_LOGIC_VECTOR(12 downto 0);
           str_from_stack : in STD_LOGIC;
           value_k_to_pc : in STD_LOGIC_VECTOR(10 downto 0);
           str_k_to_pc : in STD_LOGIC;
           str_inc_pc : in STD_LOGIC;
           gie_set : in STD_LOGIC;
           status_flags : in STD_LOGIC_VECTOR(2 downto 0);
           we_status_flags : in STD_LOGIC_VECTOR(2 downto 0);
           pc_out : out STD_LOGIC_VECTOR(12 downto 0);
           fsr_out: out STD_LOGIC_VECTOR(7 downto 0);
           status_out : out STD_LOGIC_VECTOR(7 downto 0));
end register_file;

architecture Behavioral of register_file is

component demux_we_register_file is
    Port ( we_in : in STD_LOGIC;
           addr_in : in STD_LOGIC_VECTOR (8 downto 0);
           we_out_vec : out STD_LOGIC_VECTOR(164 downto 0));
end component;

component mux_out_register_file is 
    Port ( reg_out : in mux_input_type;
           addr_in : in STD_LOGIC_VECTOR(8 downto 0);
           mux_out : out STD_LOGIC_VECTOR(7 downto 0));
end component;

component we_reg_8 is
    Port ( clk : in STD_LOGIC;
           we : in STD_LOGIC;
           din : in STD_LOGIC_VECTOR (7 downto 0);
           dout : out STD_LOGIC_VECTOR (7 downto 0));
end component;

component we_reg_13 is
    Port ( clk : in STD_LOGIC;
           we : in STD_LOGIC;
           din : in STD_LOGIC_VECTOR (12 downto 0);
           dout : out STD_LOGIC_VECTOR (12 downto 0));
end component;

component mux_1 is
    Port ( d0 : in STD_LOGIC;
           d1 : in STD_LOGIC;
           s : in STD_LOGIC;
           dout : out STD_LOGIC);
end component;

component mux_pc_input is
    Port ( value_from_stack : in STD_LOGIC_VECTOR (12 downto 0);
           ext_k_to_pc : in STD_LOGIC_VECTOR (12 downto 0);
           pc_inc : in STD_LOGIC_VECTOR (12 downto 0);
           ext_std_input : in STD_LOGIC_VECTOR (12 downto 0);
           str_inc : in STD_LOGIC;
           str_k_to_pc : in STD_LOGIC;
           str_stack : in STD_LOGIC;
           mux_out : out STD_LOGIC_VECTOR (12 downto 0));
end component;

component pc_inc is
    Port ( pc_in : in STD_LOGIC_VECTOR (12 downto 0);
           pc_inc_out : out STD_LOGIC_VECTOR (12 downto 0));
end component;

signal pom_we_out_vec : STD_LOGIC_VECTOR(164 downto 0);
    
signal pom_data_out : mux_input_type;

signal pom_pc_in_sig_13 : STD_LOGIC_VECTOR(12 downto 0);
signal pom_pc_out_sig_13 : STD_LOGIC_VECTOR(12 downto 0);
signal pom_pc_inc_sig_13 : STD_LOGIC_VECTOR(12 downto 0);

signal pom_status_input: STD_LOGIC_VECTOR(7 downto 0);

signal pom_intcon_input: STD_LOGIC_VECTOR(7 downto 0);

begin

    u_demux_we_register_file: demux_we_register_file
    port map(
        we_in => we,
        addr_in => addr_in,
        we_out_vec => pom_we_out_vec
    );
    
    
    u_we_reg_8_tmr0: we_reg_8
    port map(
        clk => clk,
        we => pom_we_out_vec(0),
        din => data_in,
        dout => pom_data_out(0)
    );
    
    u_we_reg_8_option: we_reg_8
    port map(
        clk => clk,
        we => pom_we_out_vec(1),
        din => data_in,
        dout => pom_data_out(1)
    );
    
    u_mux_pc_input: mux_pc_input
    port map(
        value_from_stack => value_from_stack,
        ext_k_to_pc(12 downto 11) => pom_data_out(11)(4 downto 3), -- PCLATH(4 downto 3)
        ext_k_to_pc(10 downto 0) => value_k_to_pc,
        pc_inc => pom_pc_inc_sig_13,
        ext_std_input(12 downto 8) => pom_pc_out_sig_13(12 downto 8),
        ext_std_input(7 downto 0) => data_in,
        str_inc => str_inc_pc,
        str_k_to_pc => str_k_to_pc,
        str_stack => str_from_stack,
        mux_out => pom_pc_in_sig_13
    );

    u_we_reg_13_pc: we_reg_13
    port map(
        clk => clk,
        we => pom_we_out_vec(2),
        din => pom_pc_in_sig_13,
        dout => pom_pc_out_sig_13
    );
    
    u_pc_inc: pc_inc
    port map(
        pc_in => pom_pc_out_sig_13,
        pc_inc_out => pom_pc_inc_sig_13
    );

    pom_data_out(2) <= pom_pc_out_sig_13(7 downto 0);

    pc_out <= pom_pc_out_sig_13;
    
    u_mux_1_z_flag : mux_1
    port map(
        d0 => data_in(2),
        d1 => status_flags(2),
        s => we_status_flags(2),
        dout => pom_status_input(2)
    );

    u_mux_1_dc_flag : mux_1
    port map(
        d0 => data_in(1),
        d1 => status_flags(1),
        s => we_status_flags(1),
        dout => pom_status_input(1)
    );

    u_mux_1_c_flag : mux_1
    port map(
        d0 => data_in(0),
        d1 => status_flags(0),
        s => we_status_flags(0),
        dout => pom_status_input(0)
    );

    pom_status_input(7 downto 3) <= data_in(7 downto 3);
    
    u_we_reg_8_status: we_reg_8
    port map(
        clk => clk,
        we => pom_we_out_vec(3),
        din => pom_status_input,
        dout => pom_data_out(3)
    );

    status_out <= pom_data_out(3);

    u_we_reg_8_fsr: we_reg_8
    port map(
        clk => clk,
        we => pom_we_out_vec(4),
        din => data_in,
        dout => pom_data_out(4)
    );

    fsr_out <= pom_data_out(4);

    u_we_reg_8_porta: we_reg_8
    port map(
        clk => clk,
        we => pom_we_out_vec(5),
        din => data_in,
        dout => pom_data_out(5)
    );

    u_we_reg_8_trisa: we_reg_8
    port map(
        clk => clk,
        we => pom_we_out_vec(6),
        din => data_in,
        dout => pom_data_out(6)
    );

    u_we_reg_8_portb: we_reg_8
    port map(
        clk => clk,
        we => pom_we_out_vec(7),
        din => data_in,
        dout => pom_data_out(7)
    );

    u_we_reg_8_trisb: we_reg_8
    port map(
        clk => clk,
        we => pom_we_out_vec(8),
        din => data_in,
        dout => pom_data_out(8)
    );

    u_we_reg_8_portc: we_reg_8
    port map(
        clk => clk,
        we => pom_we_out_vec(9),
        din => data_in,
        dout => pom_data_out(9)
    );

    u_we_reg_8_trisc: we_reg_8
    port map(
        clk => clk,
        we => pom_we_out_vec(10),
        din => data_in,
        dout => pom_data_out(10)
    );

    u_we_reg_8_pclath: we_reg_8
    port map(
        clk => clk,
        we => pom_we_out_vec(11),
        din => data_in,
        dout => pom_data_out(11)
    );

    pom_intcon_input(7) <= data_in(7) or gie_set;
    pom_intcon_input(6 downto 0) <= data_in(6 downto 0);

    u_we_reg_8_intcon: we_reg_8
    port map(
        clk => clk,
        we => pom_we_out_vec(12),
        din => pom_intcon_input,
        dout => pom_data_out(12)
    );

    u_we_reg_8_pir1: we_reg_8
    port map(
        clk => clk,
        we => pom_we_out_vec(13),
        din => data_in,
        dout => pom_data_out(13)
    );

    u_we_reg_8_pie1: we_reg_8
    port map(
        clk => clk,
        we => pom_we_out_vec(14),
        din => data_in,
        dout => pom_data_out(14)
    );

    u_we_reg_8_pmdatl: we_reg_8
    port map(
        clk => clk,
        we => pom_we_out_vec(15),
        din => data_in,
        dout => pom_data_out(15)
    );

    u_we_reg_8_pmcon1: we_reg_8
    port map(
        clk => clk,
        we => pom_we_out_vec(16),
        din => data_in,
        dout => pom_data_out(16)
    );

    u_we_reg_8_pmadrl: we_reg_8
    port map(
        clk => clk,
        we => pom_we_out_vec(17),
        din => data_in,
        dout => pom_data_out(17)
    );

    u_we_reg_8_tmr1l: we_reg_8
    port map(
        clk => clk,
        we => pom_we_out_vec(18),
        din => data_in,
        dout => pom_data_out(18)
    );

    u_we_reg_8_pcon: we_reg_8
    port map(
        clk => clk,
        we => pom_we_out_vec(19),
        din => data_in,
        dout => pom_data_out(19)
    );

    u_we_reg_8_pmdath: we_reg_8
    port map(
        clk => clk,
        we => pom_we_out_vec(20),
        din => data_in,
        dout => pom_data_out(20)
    );

    u_we_reg_8_tmr1h: we_reg_8
    port map(
        clk => clk,
        we => pom_we_out_vec(21),
        din => data_in,
        dout => pom_data_out(21)
    );

    u_we_reg_8_pmadrh: we_reg_8
    port map(
        clk => clk,
        we => pom_we_out_vec(22),
        din => data_in,
        dout => pom_data_out(22)
    );

    u_we_reg_8_t1con: we_reg_8
    port map(
        clk => clk,
        we => pom_we_out_vec(23),
        din => data_in,
        dout => pom_data_out(23)
    );

    u_we_reg_8_tmr2: we_reg_8
    port map(
        clk => clk,
        we => pom_we_out_vec(24),
        din => data_in,
        dout => pom_data_out(24)
    );

    u_we_reg_8_t2con: we_reg_8
    port map(
        clk => clk,
        we => pom_we_out_vec(25),
        din => data_in,
        dout => pom_data_out(25)
    );

    u_we_reg_8_pr2: we_reg_8
    port map(
        clk => clk,
        we => pom_we_out_vec(26),
        din => data_in,
        dout => pom_data_out(26)
    );

    u_we_reg_8_sspbuf: we_reg_8
    port map(
        clk => clk,
        we => pom_we_out_vec(27),
        din => data_in,
        dout => pom_data_out(27)
    );

    u_we_reg_8_sspadd: we_reg_8
    port map(
        clk => clk,
        we => pom_we_out_vec(28),
        din => data_in,
        dout => pom_data_out(28)
    );

    u_we_reg_8_sspcon: we_reg_8
    port map(
        clk => clk,
        we => pom_we_out_vec(29),
        din => data_in,
        dout => pom_data_out(29)
    );

    u_we_reg_8_sspstat: we_reg_8
    port map(
        clk => clk,
        we => pom_we_out_vec(30),
        din => data_in,
        dout => pom_data_out(30)
    );

    u_we_reg_8_ccpr1l: we_reg_8
    port map(
        clk => clk,
        we => pom_we_out_vec(31),
        din => data_in,
        dout => pom_data_out(31)
    );

    u_we_reg_8_ccpr1h: we_reg_8
    port map(
        clk => clk,
        we => pom_we_out_vec(32),
        din => data_in,
        dout => pom_data_out(32)
    );

    u_we_reg_8_ccp1con: we_reg_8
    port map(
        clk => clk,
        we => pom_we_out_vec(33),
        din => data_in,
        dout => pom_data_out(33)
    );

    u_we_reg_8_adres: we_reg_8
    port map(
        clk => clk,
        we => pom_we_out_vec(34),
        din => data_in,
        dout => pom_data_out(34)
    );

    u_we_reg_8_adcon0: we_reg_8
    port map(
        clk => clk,
        we => pom_we_out_vec(35),
        din => data_in,
        dout => pom_data_out(35)
    );

    u_we_reg_8_adcon1: we_reg_8
    port map(
        clk => clk,
        we => pom_we_out_vec(36),
        din => data_in,
        dout => pom_data_out(36)
    );

    -- GPRB0 & GPRB1
    gprbs: for i in 37 to 164 generate
        u_we_reg_8 : we_reg_8
        port map(
            clk => clk,
            we => pom_we_out_vec(i),
            din => data_in,
            dout => pom_data_out(i)
        );
    end generate;
    
    
    u_mux_out_register_file: mux_out_register_file
    port map(
        reg_out => pom_data_out,
        addr_in => addr_in,
        mux_out => data_out
    );
    

end Behavioral;
