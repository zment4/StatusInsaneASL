state("STATUS INSANE") {	
	int level 	   : "mono.dll", 0x00296BC8, 0x20, 0x330, 0xe0;
	bool isLoading : "mono.dll", 0x00296BC8, 0x20, 0x330, 0xe4; 
	bool RN01	   : "mono.dll", 0x00296BC8, 0x20, 0x330, 0xd8, 0x40;
	bool RN02	   : "mono.dll", 0x00296BC8, 0x20, 0x330, 0xd8, 0x41;
	bool RN03	   : "mono.dll", 0x00296BC8, 0x20, 0x330, 0xd8, 0x42;
	bool RN04	   : "mono.dll", 0x00296BC8, 0x20, 0x330, 0xd8, 0x43;
	bool RN05	   : "mono.dll", 0x00296BC8, 0x20, 0x330, 0xd8, 0x44;
	bool RN061	   : "mono.dll", 0x00296BC8, 0x20, 0x330, 0xd8, 0x45;
	bool RN062	   : "mono.dll", 0x00296BC8, 0x20, 0x330, 0xd8, 0x46;
	bool RN07	   : "mono.dll", 0x00296BC8, 0x20, 0x330, 0xd8, 0x47;
	bool RN08	   : "mono.dll", 0x00296BC8, 0x20, 0x330, 0xd8, 0x48;
	bool RN09	   : "mono.dll", 0x00296BC8, 0x20, 0x330, 0xd8, 0x49;
	bool RN10	   : "mono.dll", 0x00296BC8, 0x20, 0x330, 0xd8, 0x4a;
	bool RN11	   : "mono.dll", 0x00296BC8, 0x20, 0x330, 0xd8, 0x4b;
	bool RN12	   : "mono.dll", 0x00296BC8, 0x20, 0x330, 0xd8, 0x4c;
	bool RN13	   : "mono.dll", 0x00296BC8, 0x20, 0x330, 0xd8, 0x4d;
	bool RN14	   : "mono.dll", 0x00296BC8, 0x20, 0x330, 0xd8, 0x4e;
	bool RN15	   : "mono.dll", 0x00296BC8, 0x20, 0x330, 0xd8, 0x4f;
	bool RN16	   : "mono.dll", 0x00296BC8, 0x20, 0x330, 0xd8, 0x50;
	bool Art01	   : "mono.dll", 0x00296BC8, 0x20, 0x330, 0xd8, 0x66;
	bool Art02	   : "mono.dll", 0x00296BC8, 0x20, 0x330, 0xd8, 0x67;
	bool Art03	   : "mono.dll", 0x00296BC8, 0x20, 0x330, 0xd8, 0x68;
	bool Art04	   : "mono.dll", 0x00296BC8, 0x20, 0x330, 0xd8, 0x69;
	bool Art06	   : "mono.dll", 0x00296BC8, 0x20, 0x330, 0xd8, 0x6a;
	bool Art07	   : "mono.dll", 0x00296BC8, 0x20, 0x330, 0xd8, 0x6b;
	bool Art08	   : "mono.dll", 0x00296BC8, 0x20, 0x330, 0xd8, 0x6c;
	bool Art09	   : "mono.dll", 0x00296BC8, 0x20, 0x330, 0xd8, 0x6d;
	bool Art10	   : "mono.dll", 0x00296BC8, 0x20, 0x330, 0xd8, 0x6e;
	bool Art11	   : "mono.dll", 0x00296BC8, 0x20, 0x330, 0xd8, 0x6f;
	bool Art12	   : "mono.dll", 0x00296BC8, 0x20, 0x330, 0xd8, 0x70;
	bool Art13	   : "mono.dll", 0x00296BC8, 0x20, 0x330, 0xd8, 0x71;
	bool Art14	   : "mono.dll", 0x00296BC8, 0x20, 0x330, 0xd8, 0x72;
	bool Art15	   : "mono.dll", 0x00296BC8, 0x20, 0x330, 0xd8, 0x73;
	bool Art17	   : "mono.dll", 0x00296BC8, 0x20, 0x330, 0xd8, 0x74;
	bool Hat01	   : "mono.dll", 0x00296BC8, 0x20, 0x330, 0xd8, 0x75;	
	bool Hat02	   : "mono.dll", 0x00296BC8, 0x20, 0x330, 0xd8, 0x76;	
	bool Hat03	   : "mono.dll", 0x00296BC8, 0x20, 0x330, 0xd8, 0x77;	
	bool Hat04	   : "mono.dll", 0x00296BC8, 0x20, 0x330, 0xd8, 0x78;	
	bool Hat05	   : "mono.dll", 0x00296BC8, 0x20, 0x330, 0xd8, 0x79;	
	bool Hat06	   : "mono.dll", 0x00296BC8, 0x20, 0x330, 0xd8, 0x7a;	
	bool Hat07	   : "mono.dll", 0x00296BC8, 0x20, 0x330, 0xd8, 0x7b;	
	bool Hat08	   : "mono.dll", 0x00296BC8, 0x20, 0x330, 0xd8, 0x7c;
	int FailCount  : "mono.dll", 0x00296BC8, 0x20, 0x330, 0xd8, 0x128;
}

startup {
	print("started up");
	vars.timerModel = new TimerModel { CurrentState = timer };
	
	Func<float, float, string> stringFunc = (count, total) => {
		return count + " / " + total + "\n" + string.Format("{0,3:##0}", Math.Floor(count / total * 100)) + " %";
	};
	vars.completionStringFunc = stringFunc;
	
	vars.currentCompletionRate = stringFunc(0, 38);
	vars.noteCompletion = stringFunc(0, 15);
	vars.hatCompletion = stringFunc(0, 8);
	vars.artCompletion = stringFunc(0, 15);
}

split {
	if (old.level != current.level)
		return true;
}

start {
	return 
		old.level != current.level && 
		old.level == 26 && 
		current.level == 14;
}

reset {
	return current.level == 26;
}

isLoading {
	return current.isLoading;
}

update {
	if (current.level == 26)
		vars.timerModel.Reset();
		
	List<bool> collection = new List<bool>() {
		current.RN01,
		current.RN02,
		current.RN03,
		current.RN04,
		current.RN05,
		current.RN07,
		current.RN08,
		current.RN09,
		current.RN10,
		current.RN11,
		current.RN12,
		current.RN13,
		current.RN14,
		current.RN15,
		current.Art01,
		current.Art02,
		current.Art03,
		current.Art04,
		current.Art06,
		current.Art07,
		current.Art08,
		current.Art09,
		current.Art10,
		current.Art11,
		current.Art12,
		current.Art13,
		current.Art14,
		current.Art15,
		current.Art17,
		current.Hat01,
		current.Hat02,
		current.Hat03,
		current.Hat04,
		current.Hat05,
		current.Hat06,
		current.Hat07,
		current.Hat08
	}; 

	int totalItems = collection.Count + 1;
	float itemsCollected = collection.Count(x => x) + (current.RN061 ? 0.5f : 0) + (current.RN062 ? 0.5f : 0);
	
	vars.currentCompletionRate = vars.completionStringFunc(itemsCollected, totalItems);
	
	List<bool> notes = new List<bool>() {
		current.RN01,
		current.RN02,
		current.RN03,
		current.RN04,
		current.RN05,
		current.RN07,
		current.RN08,
		current.RN09,
		current.RN10,
		current.RN11,
		current.RN12,
		current.RN13,
		current.RN14,
		current.RN15
	}; 
	
	List<bool> arts = new List<bool>() {
		current.Art01,
		current.Art02,
		current.Art03,
		current.Art04,
		current.Art06,
		current.Art07,
		current.Art08,
		current.Art09,
		current.Art10,
		current.Art11,
		current.Art12,
		current.Art13,
		current.Art14,
		current.Art15,
		current.Art17,
	}; 	
	
	List<bool> hats = new List<bool>() {
		current.Hat01,
		current.Hat02,
		current.Hat03,
		current.Hat04,
		current.Hat05,
		current.Hat06,
		current.Hat07,
		current.Hat08
	};

	float notesCollected = notes.Count(x => x);
	if (current.RN061) notesCollected += 0.5f;
	if (current.RN062) notesCollected += 0.5f;
	
	int totalNotes = notes.Count + 1;
	
	vars.noteCompletion = vars.completionStringFunc(notesCollected, totalNotes);
	
	vars.hatCompletion = vars.completionStringFunc(hats.Count(x => x), hats.Count);
	vars.artCompletion = vars.completionStringFunc(arts.Count(x => x), arts.Count);
}