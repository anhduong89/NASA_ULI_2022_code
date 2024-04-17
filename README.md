File description:
1. cp_path.lp       : compute flight path
2. assign_charge.lp : assign charging duration
3. time_schedule.lp : assign dispatch time.
4. opt.lp           : optimization rule
5. base_data.lp     : network and vertiports.
6. init.lp          : agents.
7. solver.sh        : run file.

How to run:
in terminal : " ./solver.sh [number_of_agent] "
For example : " ./solver.sh 1 "

Notice: That example run will output all answer sets (updated optimization).
