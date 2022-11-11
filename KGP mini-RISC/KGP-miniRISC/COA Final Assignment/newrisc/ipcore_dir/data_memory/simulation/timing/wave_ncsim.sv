
 
 
 

 



window new WaveWindow  -name  "Waves for BMG Example Design"
waveform  using  "Waves for BMG Example Design"


      waveform add -signals /data_memory_tb/status
      waveform add -signals /data_memory_tb/data_memory_synth_inst/bmg_port/CLKA
      waveform add -signals /data_memory_tb/data_memory_synth_inst/bmg_port/ADDRA
      waveform add -signals /data_memory_tb/data_memory_synth_inst/bmg_port/DINA
      waveform add -signals /data_memory_tb/data_memory_synth_inst/bmg_port/WEA
      waveform add -signals /data_memory_tb/data_memory_synth_inst/bmg_port/ENA
      waveform add -signals /data_memory_tb/data_memory_synth_inst/bmg_port/DOUTA
console submit -using simulator -wait no "run"
