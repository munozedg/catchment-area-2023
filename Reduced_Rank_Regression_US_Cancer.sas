/* Reduced Rank Regression US Cancer Rates */
/* Edgar Munoz - munoze@uthscsa.edu */
/* UT Health San Antonio */

/* ods graphics on; */

/* optional varss for cumulative ss by each successive factor */

proc pls data=WORK.IMPORT cv=split cvtest(seed=78254) plots=(corrload(nfac=3) 
		diagnostics vip weights(unpack) xyscores) method=rrr;
	model bladder_female_all bladder_male_all brain_ons_female_all 
		brain_ons_male_all cervix_female_all=colon_rectum_female_all 
		colon_rectum_male_all esophagus_female_all esophagus_male_all 
		female_breast_female_all kidney_renal_pelvis_female_all 
		kidney_renal_pelvis_male_all leukemia_female_all leukemia_male_all /solution;
	output out=work.OUTPUT predicted=rrr_ypred yresidual=rrr_yresid 
		xresidual=rrr_xresid xscore=rrr_factors_xscores yscore=rrr_yrespon_yscores 
		stdy=rrr_stdzdy stdx=rrr_stdzdx tsquare=rrr_scaled_ss_scores;
run;
