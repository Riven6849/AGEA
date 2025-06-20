This algorithm is executed based on the PlatEMO 4.11 platform. You can refer to the PlatEMO documentation to run the AGEA algorithm.
We have now added `run.m` under the `AGEA/` directory. You can directly run `run.m` to obtain the results of AGEA on CEC17\_F1 to CEC17\_F29, with 25 independent runs by default. Of course, you can also modify the parameter `numRuns` to change the number of independent runs.
The resulting files will be saved in `AGEA/platemo4.11/platemo/Data/AGEA`.
After that, you can extract the result data using the `Extract.m` file located in `AGEA/platemo4.11/platemo/Data`. The extracted data will be in the format required by the competition.
