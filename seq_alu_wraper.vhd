----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.12.2022 20:39:35
-- Design Name: 
-- Module Name: seq_alu_wraper - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity seq_alu_wraper is
    Port ( clk : in STD_LOGIC;
           arg1 : in STD_LOGIC_VECTOR (7 downto 0);
           arg2 : in STD_LOGIC_VECTOR (7 downto 0);
           op : in STD_LOGIC_VECTOR (4 downto 0);
           bbb : in STD_LOGIC_VECTOR (2 downto 0);
           curC : in STD_LOGIC;
           res : out STD_LOGIC_VECTOR (7 downto 0);
           flags : out STD_LOGIC_VECTOR (2 downto 0));
end seq_alu_wraper;

architecture Behavioral of seq_alu_wraper is

    component alu is
        Port ( arg1 : in STD_LOGIC_VECTOR (7 downto 0);
               arg2 : in STD_LOGIC_VECTOR (7 downto 0);
               op : in STD_LOGIC_VECTOR(4 downto 0);
               bbb : in STD_LOGIC_VECTOR (2 downto 0);
               curC : in STD_LOGIC;
               res : out STD_LOGIC_VECTOR (7 downto 0);
               flags : out STD_LOGIC_VECTOR (2 downto 0));
    end component;
    
    component basic_reg is
        generic ( data_width : POSITIVE := 8);
        Port ( clk : in STD_LOGIC;
               reg_in : in STD_LOGIC_VECTOR( data_width - 1 downto 0);
               reg_out : out STD_LOGIC_VECTOR( data_width - 1 downto 0));
    end component;
    
    signal inner_arg1_sig : STD_LOGIC_VECTOR(7 downto 0);
    signal inner_arg2_sig : STD_LOGIC_VECTOR(7 downto 0);
    signal inner_op_sig : STD_LOGIC_VECTOR(4 downto 0);
    signal inner_bbb_sig : STD_LOGIC_VECTOR(2 downto 0);
    signal inner_curC_sig : STD_LOGIC_VECTOR(0 downto 0);
    
    signal inner_res_sig : STD_LOGIC_VECTOR(7 downto 0);
    signal inner_flags_sig : STD_LOGIC_VECTOR(2 downto 0);

begin

    u_alu : alu
    port map(
        arg1 => inner_arg1_sig,
        arg2 => inner_arg2_sig,
        op => inner_op_sig,
        bbb => inner_bbb_sig,
        curC => inner_curC_sig(0),
        res => inner_res_sig,
        flags => inner_flags_sig
    );
    
    u_reg_arg1 : basic_reg
    generic map (
        data_width => 8
    )
    port map (
        clk => clk,
        reg_in => arg1,
        reg_out => inner_arg1_sig
    );
    
    u_reg_arg2 : basic_reg
    generic map (
        data_width => 8
    )
    port map (
        clk => clk,
        reg_in => arg2,
        reg_out => inner_arg2_sig
    );
    
    u_reg_op : basic_reg
    generic map (
        data_width => 5
    )
    port map (
        clk => clk,
        reg_in => op,
        reg_out => inner_op_sig
    );
    
    u_reg_bbb : basic_reg
    generic map (
        data_width => 3
    )
    port map (
        clk => clk,
        reg_in => bbb,
        reg_out => inner_bbb_sig
    );
    
    u_reg_curC : basic_reg
    generic map (
        data_width => 1
    )
    port map (
        clk => clk,
        reg_in(0) => curC,
        reg_out => inner_curC_sig
    );
    
    u_reg_res : basic_reg
    generic map (
        data_width => 8
    )
    port map (
        clk => clk,
        reg_in => inner_res_sig,
        reg_out => res
    );
    
    u_reg_flags : basic_reg
    generic map (
        data_width => 3
    )
    port map (
        clk => clk,
        reg_in => inner_flags_sig,
        reg_out => flags
    );
    
end Behavioral;
