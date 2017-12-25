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
	timer.CurrentTimingMethod = TimingMethod.GameTime;
	
	settings.Add("fullRun", false, "100 % Required");
	settings.SetToolTip("fullRun", "The last split isn't activated unless you have 100 % completion rate when exiting the last level");
	
	vars.timerModel = new TimerModel { CurrentState = timer };
	
	Func<float, float, string> stringFunc = (count, total) => {
		System.Threading.Thread.CurrentThread.CurrentCulture = System.Globalization.CultureInfo.InvariantCulture;
		return count + " / " + total + "\n" + string.Format("{0,3:##0.#}", Math.Floor(count / total * 100)) + " %";
	};
	vars.CompletionStringFunc = stringFunc;
	vars.collection = new List<bool>() { false };
	
	Action<dynamic> progressAction = (c) => {
		vars.collection = new List<bool>() {
			c.RN01,
			c.RN02,
			c.RN03,
			c.RN04,
			c.RN05,
			c.RN07,
			c.RN08,
			c.RN09,
			c.RN10,
			c.RN11,
			c.RN12,
			c.RN13,
			c.RN14,
			c.RN15,
			c.Art01,
			c.Art02,
			c.Art03,
			c.Art04,
			c.Art06,
			c.Art07,
			c.Art08,
			c.Art09,
			c.Art10,
			c.Art11,
			c.Art12,
			c.Art13,
			c.Art14,
			c.Art15,
			c.Art17,
			c.Hat01,
			c.Hat02,
			c.Hat03,
			c.Hat04,
			c.Hat05,
			c.Hat06,
			c.Hat07,
			c.Hat08
		}; 

		vars.notes = new List<bool>() {
			c.RN01,
			c.RN02,
			c.RN03,
			c.RN04,
			c.RN05,
			c.RN07,
			c.RN08,
			c.RN09,
			c.RN10,
			c.RN11,
			c.RN12,
			c.RN13,
			c.RN14,
			c.RN15
		}; 
		
		vars.arts = new List<bool>() {
			c.Art01,
			c.Art02,
			c.Art03,
			c.Art04,
			c.Art06,
			c.Art07,
			c.Art08,
			c.Art09,
			c.Art10,
			c.Art11,
			c.Art12,
			c.Art13,
			c.Art14,
			c.Art15,
			c.Art17,
		}; 	
	
		vars.hats = new List<bool>() {
			c.Hat01,
			c.Hat02,
			c.Hat03,
			c.Hat04,
			c.Hat05,
			c.Hat06,
			c.Hat07,
			c.Hat08
		};
	};
	
	vars.UpdateProgressAction = progressAction;
	
	vars.currentCompletionRate = stringFunc(0, 38);
	vars.noteCompletion = stringFunc(0, 15);
	vars.hatCompletion = stringFunc(0, 8);
	vars.artCompletion = stringFunc(0, 15);
	
	Action<string, string> setTextComponent = (id, text) => {
		var textSettings = timer.Layout.Components.Where(x => x.GetType().Name == "TextComponent").Select(x => x.GetType().GetProperty("Settings").GetValue(x, null));
		var textSetting = textSettings.FirstOrDefault(x => (x.GetType().GetProperty("Text1").GetValue(x, null) as string) == id);
		if (textSetting != null)
		{
			textSetting.GetType().GetProperty("Text2").SetValue(textSetting, text);
		}
	};
	
	vars.SetTextComponent = setTextComponent;
	
	vars.allCollected = false;
}

init {
	vars.UpdateProgressAction(current);
	
	vars.currentCompletionRate = vars.CompletionStringFunc(0, 38);
	vars.noteCompletion = vars.CompletionStringFunc(0, 15);
	vars.hatCompletion = vars.CompletionStringFunc(0, 8);
	vars.artCompletion = vars.CompletionStringFunc(0, 15);
	
	vars.SetTextComponent("Completion Rate", vars.currentCompletionRate);
	vars.SetTextComponent("Notes Progress", vars.noteCompletion);
	vars.SetTextComponent("Hats Progress", vars.hatCompletion);
	vars.SetTextComponent("Arts Progress", vars.artCompletion);
}

split {
	var isLastSplit = timer.CurrentSplitIndex == timer.Run.Count - 1;
	
	// on full run and last split, split only if everything is collected
	if (settings["fullRun"] && isLastSplit)
	{
		return 
			vars.allCollected && 
			old.level != current.level && 
			current.level == 25;
	}
	
	// if last split, only split when entering the game outro
	if (isLastSplit)
	{
		return 
			old.level != current.level &&
			current.level == 25;
	}
	
	// Default to splitting on level change
	if (old.level != current.level)
	{
		// able to finish run, make sure we are in the last split
		if (((settings["fullRun"] && vars.allCollected) || !settings["fullRun"]) && current.level == 25)
		{
			timer.CurrentSplitIndex = timer.Run.Count - 1;
		}
		return true;
	}
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
	
	vars.UpdateProgressAction(current);
	
	int totalItems = vars.collection.Count + 1;
	
	float itemsCollected = (vars.collection as List<bool>).Count(x => x) + (current.RN061 ? 0.5f : 0) + (current.RN062 ? 0.5f : 0);
	
	float notesCollected = (vars.notes as List<bool>).Count(x => x);
	if (current.RN061) notesCollected += 0.5f;
	if (current.RN062) notesCollected += 0.5f;
	
	int totalNotes = vars.notes.Count + 1;

	vars.allCollected = totalItems == (int) Math.Round(itemsCollected);
	
	vars.currentCompletionRate = vars.CompletionStringFunc(itemsCollected, totalItems);
	vars.noteCompletion = vars.CompletionStringFunc(notesCollected, totalNotes);
	vars.hatCompletion = vars.CompletionStringFunc((vars.hats as List<bool>).Count(x => x), vars.hats.Count);
	vars.artCompletion = vars.CompletionStringFunc((vars.arts as List<bool>).Count(x => x), vars.arts.Count);			
	
	vars.SetTextComponent("Completion Rate", vars.currentCompletionRate);
	vars.SetTextComponent("Notes Progress", vars.noteCompletion);
	vars.SetTextComponent("Hats Progress", vars.hatCompletion);
	vars.SetTextComponent("Arts Progress", vars.artCompletion);
	
	vars.SetTextComponent("Fail Count", current.FailCount.ToString());
}