----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.12.2022 13:14:58
-- Design Name: 
-- Module Name: demux_we_register_file - Behavioral
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

entity demux_we_register_file is
    Port ( we_in : in STD_LOGIC;
           addr_in : in STD_LOGIC_VECTOR (8 downto 0);
           we_out_vec : out STD_LOGIC_VECTOR(164 downto 0));
end demux_we_register_file;

architecture Behavioral of demux_we_register_file is

begin
    
    process(we_in, addr_in)
    begin
        we_out_vec <= (others => '0');
        case addr_in is
            when B"0_0000_0001" | B"1_0000_0001" =>
                we_out_vec(0) <= we_in; -- TMR0
            when B"0_1000_0001" | B"1_1000_0001" =>
                we_out_vec(1) <= we_in; -- OPTION
            when B"0_0000_0010" | B"0_1000_0010" | B"1_0000_0010" | B"1_1000_0010" =>
                we_out_vec(2) <= we_in; -- PCL
            when B"0_0000_0011" | B"0_1000_0011" | B"1_0000_0011" | B"1_1000_0011" =>
                we_out_vec(3) <= we_in; -- STATUS
            when B"0_0000_0100" | B"0_1000_0100" | B"1_0000_0100" | B"1_1000_0100" =>
                we_out_vec(4) <= we_in; -- FSR
            when B"0_0000_0101" =>
                we_out_vec(5) <= we_in; -- PORTA
            when B"0_1000_0101" =>
                we_out_vec(6) <= we_in; -- TRISA
            when B"0_0000_0110" | B"1_0000_0110" =>
                we_out_vec(7) <= we_in; -- PORTB
            when B"0_1000_0110" | B"1_1000_0110" =>
                we_out_vec(8) <= we_in; -- TRISB
            when B"0_0000_0111" =>
                we_out_vec(9) <= we_in; -- PORTC
            when B"0_1000_0111" =>
                we_out_vec(10) <= we_in; -- TRISC
            when B"0_0000_1010" | B"0_1000_1010" | B"1_0000_1010" | B"1_1000_1010" =>
                we_out_vec(11) <= we_in; -- PCLATH
            when B"0_0000_1011" | B"0_1000_1011" | B"1_0000_1011" | B"1_1000_1011" =>
                we_out_vec(12) <= we_in; -- INTCON
            when B"0_0000_1100" =>
                we_out_vec(13) <= we_in; -- PIR1
            when B"0_1000_1100" =>
                we_out_vec(14) <= we_in; -- PIE1
            when B"1_0000_1100" =>
                we_out_vec(15) <= we_in; -- PMDATL
            when B"1_1000_1100" =>
                we_out_vec(16) <= we_in; -- PMCON1
            when B"1_0000_1101" =>
                we_out_vec(17) <= we_in; -- PMADRL
            when B"0_0000_1110" =>
                we_out_vec(18) <= we_in; -- TMR1L
            when B"0_1000_1110" =>
                we_out_vec(19) <= we_in; -- PCON
            when B"1_0000_1110" =>
                we_out_vec(20) <= we_in; -- PMDATH
            when B"0_0000_1111" =>
                we_out_vec(21) <= we_in; -- TMR1H
            when B"1_0000_1111" =>
                we_out_vec(22) <= we_in; -- PMADRH
            when B"0_0001_0000" =>
                we_out_vec(23) <= we_in; -- T1CON
            when B"0_0001_0001" =>
                we_out_vec(24) <= we_in; -- TMR2
            when B"0_0001_0010" =>
                we_out_vec(25) <= we_in; -- T2CON
            when B"0_1001_0010" =>
                we_out_vec(26) <= we_in; -- PR2
            when B"0_0001_0011" =>
                we_out_vec(27) <= we_in; -- SSPBUF
            when B"0_1001_0011" =>
                we_out_vec(28) <= we_in; -- SSPADD
            when B"0_0001_0100" =>
                we_out_vec(29) <= we_in; -- SSPCON
            when B"0_1001_0100" =>
                we_out_vec(30) <= we_in; -- SSPSTAT
            when B"0_0001_0101" =>
                we_out_vec(31) <= we_in; -- CCPR1L
            when B"0_0001_0110" =>
                we_out_vec(32) <= we_in; -- CCPR1H
            when B"0_0001_0111" =>
                we_out_vec(33) <= we_in; -- CCP1CON
            when B"0_0001_1110" =>
                we_out_vec(34) <= we_in; -- ADRES
            when B"0_0001_1111" =>
                we_out_vec(35) <= we_in; -- ADCON0
            when B"0_1001_1111" =>
                we_out_vec(36) <= we_in; -- ADCON1
            -- GPRB0 (double access)
            when B"0_0010_0000" | B"1_0010_0000" =>
                we_out_vec(37) <= we_in;
            when B"0_0010_0001" | B"1_0010_0001" =>
                we_out_vec(38) <= we_in;
            when B"0_0010_0010" | B"1_0010_0010" =>
                we_out_vec(39) <= we_in;
            when B"0_0010_0011" | B"1_0010_0011" =>
                we_out_vec(40) <= we_in;
            when B"0_0010_0100" | B"1_0010_0100" =>
                we_out_vec(41) <= we_in;
            when B"0_0010_0101" | B"1_0010_0101" =>
                we_out_vec(42) <= we_in;
            when B"0_0010_0110" | B"1_0010_0110" =>
                we_out_vec(43) <= we_in;
            when B"0_0010_0111" | B"1_0010_0111" =>
                we_out_vec(44) <= we_in;
            when B"0_0010_1000" | B"1_0010_1000" =>
                we_out_vec(45) <= we_in;
            when B"0_0010_1001" | B"1_0010_1001" =>
                we_out_vec(46) <= we_in;
            when B"0_0010_1010" | B"1_0010_1010" =>
                we_out_vec(47) <= we_in;
            when B"0_0010_1011" | B"1_0010_1011" =>
                we_out_vec(48) <= we_in;
            when B"0_0010_1100" | B"1_0010_1100" =>
                we_out_vec(49) <= we_in;
            when B"0_0010_1101" | B"1_0010_1101" =>
                we_out_vec(50) <= we_in;
            when B"0_0010_1110" | B"1_0010_1110" =>
                we_out_vec(51) <= we_in;
            when B"0_0010_1111" | B"1_0010_1111" =>
                we_out_vec(52) <= we_in;
            when B"0_0011_0000" | B"1_0011_0000" =>
                we_out_vec(53) <= we_in;
            when B"0_0011_0001" | B"1_0011_0001" =>
                we_out_vec(54) <= we_in;
            when B"0_0011_0010" | B"1_0011_0010" =>
                we_out_vec(55) <= we_in;
            when B"0_0011_0011" | B"1_0011_0011" =>
                we_out_vec(56) <= we_in;
            when B"0_0011_0100" | B"1_0011_0100" =>
                we_out_vec(57) <= we_in;
            when B"0_0011_0101" | B"1_0011_0101" =>
                we_out_vec(58) <= we_in;
            when B"0_0011_0110" | B"1_0011_0110" =>
                we_out_vec(59) <= we_in;
            when B"0_0011_0111" | B"1_0011_0111" =>
                we_out_vec(60) <= we_in;
            when B"0_0011_1000" | B"1_0011_1000" =>
                we_out_vec(61) <= we_in;
            when B"0_0011_1001" | B"1_0011_1001" =>
                we_out_vec(62) <= we_in;
            when B"0_0011_1010" | B"1_0011_1010" =>
                we_out_vec(63) <= we_in;
            when B"0_0011_1011" | B"1_0011_1011" =>
                we_out_vec(64) <= we_in;
            when B"0_0011_1100" | B"1_0011_1100" =>
                we_out_vec(65) <= we_in;
            when B"0_0011_1101" | B"1_0011_1101" =>
                we_out_vec(66) <= we_in;
            when B"0_0011_1110" | B"1_0011_1110" =>
                we_out_vec(67) <= we_in;
            when B"0_0011_1111" | B"1_0011_1111" =>
                we_out_vec(68) <= we_in;
            -- GPRB0 (quadruple access)
            when B"0_0100_0000" | B"0_1100_0000" | B"1_0100_0000" | B"1_1100_0000" =>
                we_out_vec(69) <= we_in;
            when B"0_0100_0001" | B"0_1100_0001" | B"1_0100_0001" | B"1_1100_0001" =>
                we_out_vec(70) <= we_in;
            when B"0_0100_0010" | B"0_1100_0010" | B"1_0100_0010" | B"1_1100_0010" =>
                we_out_vec(71) <= we_in;
            when B"0_0100_0011" | B"0_1100_0011" | B"1_0100_0011" | B"1_1100_0011" =>
                we_out_vec(72) <= we_in;
            when B"0_0100_0100" | B"0_1100_0100" | B"1_0100_0100" | B"1_1100_0100" =>
                we_out_vec(73) <= we_in;
            when B"0_0100_0101" | B"0_1100_0101" | B"1_0100_0101" | B"1_1100_0101" =>
                we_out_vec(74) <= we_in;
            when B"0_0100_0110" | B"0_1100_0110" | B"1_0100_0110" | B"1_1100_0110" =>
                we_out_vec(75) <= we_in;
            when B"0_0100_0111" | B"0_1100_0111" | B"1_0100_0111" | B"1_1100_0111" =>
                we_out_vec(76) <= we_in;
            when B"0_0100_1000" | B"0_1100_1000" | B"1_0100_1000" | B"1_1100_1000" =>
                we_out_vec(77) <= we_in;
            when B"0_0100_1001" | B"0_1100_1001" | B"1_0100_1001" | B"1_1100_1001" =>
                we_out_vec(78) <= we_in;
            when B"0_0100_1010" | B"0_1100_1010" | B"1_0100_1010" | B"1_1100_1010" =>
                we_out_vec(79) <= we_in;
            when B"0_0100_1011" | B"0_1100_1011" | B"1_0100_1011" | B"1_1100_1011" =>
                we_out_vec(80) <= we_in;
            when B"0_0100_1100" | B"0_1100_1100" | B"1_0100_1100" | B"1_1100_1100" =>
                we_out_vec(81) <= we_in;
            when B"0_0100_1101" | B"0_1100_1101" | B"1_0100_1101" | B"1_1100_1101" =>
                we_out_vec(82) <= we_in;
            when B"0_0100_1110" | B"0_1100_1110" | B"1_0100_1110" | B"1_1100_1110" =>
                we_out_vec(83) <= we_in;
            when B"0_0100_1111" | B"0_1100_1111" | B"1_0100_1111" | B"1_1100_1111" =>
                we_out_vec(84) <= we_in;
            when B"0_0101_0000" | B"0_1101_0000" | B"1_0101_0000" | B"1_1101_0000" =>
                we_out_vec(85) <= we_in;
            when B"0_0101_0001" | B"0_1101_0001" | B"1_0101_0001" | B"1_1101_0001" =>
                we_out_vec(86) <= we_in;
            when B"0_0101_0010" | B"0_1101_0010" | B"1_0101_0010" | B"1_1101_0010" =>
                we_out_vec(87) <= we_in;
            when B"0_0101_0011" | B"0_1101_0011" | B"1_0101_0011" | B"1_1101_0011" =>
                we_out_vec(88) <= we_in;
            when B"0_0101_0100" | B"0_1101_0100" | B"1_0101_0100" | B"1_1101_0100" =>
                we_out_vec(89) <= we_in;
            when B"0_0101_0101" | B"0_1101_0101" | B"1_0101_0101" | B"1_1101_0101" =>
                we_out_vec(90) <= we_in;
            when B"0_0101_0110" | B"0_1101_0110" | B"1_0101_0110" | B"1_1101_0110" =>
                we_out_vec(91) <= we_in;
            when B"0_0101_0111" | B"0_1101_0111" | B"1_0101_0111" | B"1_1101_0111" =>
                we_out_vec(92) <= we_in;
            when B"0_0101_1000" | B"0_1101_1000" | B"1_0101_1000" | B"1_1101_1000" =>
                we_out_vec(93) <= we_in;
            when B"0_0101_1001" | B"0_1101_1001" | B"1_0101_1001" | B"1_1101_1001" =>
                we_out_vec(94) <= we_in;
            when B"0_0101_1010" | B"0_1101_1010" | B"1_0101_1010" | B"1_1101_1010" =>
                we_out_vec(95) <= we_in;
            when B"0_0101_1011" | B"0_1101_1011" | B"1_0101_1011" | B"1_1101_1011" =>
                we_out_vec(96) <= we_in;
            when B"0_0101_1100" | B"0_1101_1100" | B"1_0101_1100" | B"1_1101_1100" =>
                we_out_vec(97) <= we_in;
            when B"0_0101_1101" | B"0_1101_1101" | B"1_0101_1101" | B"1_1101_1101" =>
                we_out_vec(98) <= we_in;
            when B"0_0101_1110" | B"0_1101_1110" | B"1_0101_1110" | B"1_1101_1110" =>
                we_out_vec(99) <= we_in;
            when B"0_0101_1111" | B"0_1101_1111" | B"1_0101_1111" | B"1_1101_1111" =>
                we_out_vec(100) <= we_in;
            when B"0_0110_0000" | B"0_1110_0000" | B"1_0110_0000" | B"1_1110_0000" =>
                we_out_vec(101) <= we_in;
            when B"0_0110_0001" | B"0_1110_0001" | B"1_0110_0001" | B"1_1110_0001" =>
                we_out_vec(102) <= we_in;
            when B"0_0110_0010" | B"0_1110_0010" | B"1_0110_0010" | B"1_1110_0010" =>
                we_out_vec(103) <= we_in;
            when B"0_0110_0011" | B"0_1110_0011" | B"1_0110_0011" | B"1_1110_0011" =>
                we_out_vec(104) <= we_in;
            when B"0_0110_0100" | B"0_1110_0100" | B"1_0110_0100" | B"1_1110_0100" =>
                we_out_vec(105) <= we_in;
            when B"0_0110_0101" | B"0_1110_0101" | B"1_0110_0101" | B"1_1110_0101" =>
                we_out_vec(106) <= we_in;
            when B"0_0110_0110" | B"0_1110_0110" | B"1_0110_0110" | B"1_1110_0110" =>
                we_out_vec(107) <= we_in;
            when B"0_0110_0111" | B"0_1110_0111" | B"1_0110_0111" | B"1_1110_0111" =>
                we_out_vec(108) <= we_in;
            when B"0_0110_1000" | B"0_1110_1000" | B"1_0110_1000" | B"1_1110_1000" =>
                we_out_vec(109) <= we_in;
            when B"0_0110_1001" | B"0_1110_1001" | B"1_0110_1001" | B"1_1110_1001" =>
                we_out_vec(110) <= we_in;
            when B"0_0110_1010" | B"0_1110_1010" | B"1_0110_1010" | B"1_1110_1010" =>
                we_out_vec(111) <= we_in;
            when B"0_0110_1011" | B"0_1110_1011" | B"1_0110_1011" | B"1_1110_1011" =>
                we_out_vec(112) <= we_in;
            when B"0_0110_1100" | B"0_1110_1100" | B"1_0110_1100" | B"1_1110_1100" =>
                we_out_vec(113) <= we_in;
            when B"0_0110_1101" | B"0_1110_1101" | B"1_0110_1101" | B"1_1110_1101" =>
                we_out_vec(114) <= we_in;
            when B"0_0110_1110" | B"0_1110_1110" | B"1_0110_1110" | B"1_1110_1110" =>
                we_out_vec(115) <= we_in;
            when B"0_0110_1111" | B"0_1110_1111" | B"1_0110_1111" | B"1_1110_1111" =>
                we_out_vec(116) <= we_in;
            when B"0_0111_0000" | B"0_1111_0000" | B"1_0111_0000" | B"1_1111_0000" =>
                we_out_vec(117) <= we_in;
            when B"0_0111_0001" | B"0_1111_0001" | B"1_0111_0001" | B"1_1111_0001" =>
                we_out_vec(118) <= we_in;
            when B"0_0111_0010" | B"0_1111_0010" | B"1_0111_0010" | B"1_1111_0010" =>
                we_out_vec(119) <= we_in;
            when B"0_0111_0011" | B"0_1111_0011" | B"1_0111_0011" | B"1_1111_0011" =>
                we_out_vec(120) <= we_in;
            when B"0_0111_0100" | B"0_1111_0100" | B"1_0111_0100" | B"1_1111_0100" =>
                we_out_vec(121) <= we_in;
            when B"0_0111_0101" | B"0_1111_0101" | B"1_0111_0101" | B"1_1111_0101" =>
                we_out_vec(122) <= we_in;
            when B"0_0111_0110" | B"0_1111_0110" | B"1_0111_0110" | B"1_1111_0110" =>
                we_out_vec(123) <= we_in;
            when B"0_0111_0111" | B"0_1111_0111" | B"1_0111_0111" | B"1_1111_0111" =>
                we_out_vec(124) <= we_in;
            when B"0_0111_1000" | B"0_1111_1000" | B"1_0111_1000" | B"1_1111_1000" =>
                we_out_vec(125) <= we_in;
            when B"0_0111_1001" | B"0_1111_1001" | B"1_0111_1001" | B"1_1111_1001" =>
                we_out_vec(126) <= we_in;
            when B"0_0111_1010" | B"0_1111_1010" | B"1_0111_1010" | B"1_1111_1010" =>
                we_out_vec(127) <= we_in;
            when B"0_0111_1011" | B"0_1111_1011" | B"1_0111_1011" | B"1_1111_1011" =>
                we_out_vec(128) <= we_in;
            when B"0_0111_1100" | B"0_1111_1100" | B"1_0111_1100" | B"1_1111_1100" =>
                we_out_vec(129) <= we_in;
            when B"0_0111_1101" | B"0_1111_1101" | B"1_0111_1101" | B"1_1111_1101" =>
                we_out_vec(130) <= we_in;
            when B"0_0111_1110" | B"0_1111_1110" | B"1_0111_1110" | B"1_1111_1110" =>
                we_out_vec(131) <= we_in;
            when B"0_0111_1111" | B"0_1111_1111" | B"1_0111_1111" | B"1_1111_1111" =>
                we_out_vec(132) <= we_in;
            -- GPRB1 (double access)
            when B"0_1010_0000" | B"1_1010_0000" =>
                we_out_vec(133) <= we_in;
            when B"0_1010_0001" | B"1_1010_0001" =>
                we_out_vec(134) <= we_in;
            when B"0_1010_0010" | B"1_1010_0010" =>
                we_out_vec(135) <= we_in;
            when B"0_1010_0011" | B"1_1010_0011" =>
                we_out_vec(136) <= we_in;
            when B"0_1010_0100" | B"1_1010_0100" =>
                we_out_vec(137) <= we_in;
            when B"0_1010_0101" | B"1_1010_0101" =>
                we_out_vec(138) <= we_in;
            when B"0_1010_0110" | B"1_1010_0110" =>
                we_out_vec(139) <= we_in;
            when B"0_1010_0111" | B"1_1010_0111" =>
                we_out_vec(140) <= we_in;
            when B"0_1010_1000" | B"1_1010_1000" =>
                we_out_vec(141) <= we_in;
            when B"0_1010_1001" | B"1_1010_1001" =>
                we_out_vec(142) <= we_in;
            when B"0_1010_1010" | B"1_1010_1010" =>
                we_out_vec(143) <= we_in;
            when B"0_1010_1011" | B"1_1010_1011" =>
                we_out_vec(144) <= we_in;
            when B"0_1010_1100" | B"1_1010_1100" =>
                we_out_vec(145) <= we_in;
            when B"0_1010_1101" | B"1_1010_1101" =>
                we_out_vec(146) <= we_in;
            when B"0_1010_1110" | B"1_1010_1110" =>
                we_out_vec(147) <= we_in;
            when B"0_1010_1111" | B"1_1010_1111" =>
                we_out_vec(148) <= we_in;
            when B"0_1011_0000" | B"1_1011_0000" =>
                we_out_vec(149) <= we_in;
            when B"0_1011_0001" | B"1_1011_0001" =>
                we_out_vec(150) <= we_in;
            when B"0_1011_0010" | B"1_1011_0010" =>
                we_out_vec(151) <= we_in;
            when B"0_1011_0011" | B"1_1011_0011" =>
                we_out_vec(152) <= we_in;
            when B"0_1011_0100" | B"1_1011_0100" =>
                we_out_vec(153) <= we_in;
            when B"0_1011_0101" | B"1_1011_0101" =>
                we_out_vec(154) <= we_in;
            when B"0_1011_0110" | B"1_1011_0110" =>
                we_out_vec(155) <= we_in;
            when B"0_1011_0111" | B"1_1011_0111" =>
                we_out_vec(156) <= we_in;
            when B"0_1011_1000" | B"1_1011_1000" =>
                we_out_vec(157) <= we_in;
            when B"0_1011_1001" | B"1_1011_1001" =>
                we_out_vec(158) <= we_in;
            when B"0_1011_1010" | B"1_1011_1010" =>
                we_out_vec(159) <= we_in;
            when B"0_1011_1011" | B"1_1011_1011" =>
                we_out_vec(160) <= we_in;
            when B"0_1011_1100" | B"1_1011_1100" =>
                we_out_vec(161) <= we_in;
            when B"0_1011_1101" | B"1_1011_1101" =>
                we_out_vec(162) <= we_in;
            when B"0_1011_1110" | B"1_1011_1110" =>
                we_out_vec(163) <= we_in;
            when B"0_1011_1111" | B"1_1011_1111" =>
                we_out_vec(164) <= we_in;
            when others =>
                we_out_vec <= (others => '0');
        end case;
    end process;
    
end Behavioral;
