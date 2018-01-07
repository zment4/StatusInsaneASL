state("STATUS INSANE") {	
	int level 	   : "mono.dll", 0x00262110, 0xA0, 0x88;
	bool isLoading : "mono.dll", 0x00262110, 0xA0, 0x85; 
	bool RN01	   : "mono.dll", 0x00262110, 0xA0, 0x40;
	bool RN02	   : "mono.dll", 0x00262110, 0xA0, 0x41;
	bool RN03	   : "mono.dll", 0x00262110, 0xA0, 0x42;
	bool RN04	   : "mono.dll", 0x00262110, 0xA0, 0x43;
	bool RN05	   : "mono.dll", 0x00262110, 0xA0, 0x44;
	bool RN061	   : "mono.dll", 0x00262110, 0xA0, 0x45;
	bool RN062	   : "mono.dll", 0x00262110, 0xA0, 0x46;
	bool RN07	   : "mono.dll", 0x00262110, 0xA0, 0x47;
	bool RN08	   : "mono.dll", 0x00262110, 0xA0, 0x48;
	bool RN09	   : "mono.dll", 0x00262110, 0xA0, 0x49;
	bool RN10	   : "mono.dll", 0x00262110, 0xA0, 0x4a;
	bool RN11	   : "mono.dll", 0x00262110, 0xA0, 0x4b;
	bool RN12	   : "mono.dll", 0x00262110, 0xA0, 0x4c;
	bool RN13	   : "mono.dll", 0x00262110, 0xA0, 0x4d;
	bool RN14	   : "mono.dll", 0x00262110, 0xA0, 0x4e;
	bool RN15	   : "mono.dll", 0x00262110, 0xA0, 0x4f;
	bool RN16	   : "mono.dll", 0x00262110, 0xA0, 0x50;
	bool Art01	   : "mono.dll", 0x00262110, 0xA0, 0x66;
	bool Art02	   : "mono.dll", 0x00262110, 0xA0, 0x67;
	bool Art03	   : "mono.dll", 0x00262110, 0xA0, 0x68;
	bool Art04	   : "mono.dll", 0x00262110, 0xA0, 0x69;
	bool Art06	   : "mono.dll", 0x00262110, 0xA0, 0x6a;
	bool Art07	   : "mono.dll", 0x00262110, 0xA0, 0x6b;
	bool Art08	   : "mono.dll", 0x00262110, 0xA0, 0x6c;
	bool Art09	   : "mono.dll", 0x00262110, 0xA0, 0x6d;
	bool Art10	   : "mono.dll", 0x00262110, 0xA0, 0x6e;
	bool Art11	   : "mono.dll", 0x00262110, 0xA0, 0x6f;
	bool Art12	   : "mono.dll", 0x00262110, 0xA0, 0x70;
	bool Art13	   : "mono.dll", 0x00262110, 0xA0, 0x71;
	bool Art14	   : "mono.dll", 0x00262110, 0xA0, 0x72;
	bool Art15	   : "mono.dll", 0x00262110, 0xA0, 0x73;
	bool Art17	   : "mono.dll", 0x00262110, 0xA0, 0x74;
	bool Hat01	   : "mono.dll", 0x00262110, 0xA0, 0x75;	
	bool Hat02	   : "mono.dll", 0x00262110, 0xA0, 0x76;	
	bool Hat03	   : "mono.dll", 0x00262110, 0xA0, 0x77;	
	bool Hat04	   : "mono.dll", 0x00262110, 0xA0, 0x78;	
	bool Hat05	   : "mono.dll", 0x00262110, 0xA0, 0x79;	
	bool Hat06	   : "mono.dll", 0x00262110, 0xA0, 0x7a;	
	bool Hat07	   : "mono.dll", 0x00262110, 0xA0, 0x7b;	
	bool Hat08	   : "mono.dll", 0x00262110, 0xA0, 0x7c;
	int FailCount  : "mono.dll", 0x00262110, 0xA0, 0x130;
}

startup {
	System.Threading.Thread.CurrentThread.CurrentCulture = System.Globalization.CultureInfo.InvariantCulture;

	timer.CurrentTimingMethod = TimingMethod.GameTime;
	
	vars.timerModel = new TimerModel { CurrentState = timer };
	vars.fullRun = timer.Run.CategoryName == "100%" || timer.Run.CategoryName == "OYB%";
	vars.oybRun = timer.Run.CategoryName == "OYB%";
			
	vars.allCollected = false;
		
	vars.collection = new List<bool>() { false };
	
	vars.CompletionStringFunc = (Func<float, float, bool, string>)((count, total, showPercentage) => {
		var ret = "";
		
		if (showPercentage)
			ret += string.Format("{0,3:##0.#}", Math.Floor(count / total * 100)) + " %";
			
		ret += (showPercentage ? "\n" : "") + count + " / " + total;
		
		return ret;
	});
	
	vars.UpdateProgressAction = (Action<dynamic>)((c) => {
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
		
		vars.oybHats = new List<bool>() { 
			c.Hat07, 
			c.Hat08 
		};
	});
	
	vars.SetTextComponent = (Action<string, string>)((id, text) => {
		var textSettings = timer.Layout.Components.Where(x => x.GetType().Name == "TextComponent").Select(x => x.GetType().GetProperty("Settings").GetValue(x, null));
		var textSetting = textSettings.FirstOrDefault(x => (x.GetType().GetProperty("Text1").GetValue(x, null) as string) == id);
		if (textSetting != null)
		{
			textSetting.GetType().GetProperty("Text2").SetValue(textSetting, text);
		}
	});
	
	vars.SetTextComponentColor = (Action<string, System.Drawing.Color>)((id, color) => {
		var textSettings = timer.Layout.Components.Where(x => x.GetType().Name == "TextComponent").Select(x => x.GetType().GetProperty("Settings").GetValue(x, null));
		var textSetting = textSettings.FirstOrDefault(x => (x.GetType().GetProperty("Text1").GetValue(x, null) as string) == id);
		if (textSetting != null)
		{
			if (color == System.Drawing.Color.White)
			{
				textSetting.GetType().GetProperty("OverrideTextColor").SetValue(textSetting, false);
				textSetting.GetType().GetProperty("OverrideTimeColor").SetValue(textSetting, false);
			} else {
				textSetting.GetType().GetProperty("TextColor").SetValue(textSetting, color);
				textSetting.GetType().GetProperty("OverrideTextColor").SetValue(textSetting, true);
				textSetting.GetType().GetProperty("TimeColor").SetValue(textSetting, color);
				textSetting.GetType().GetProperty("OverrideTimeColor").SetValue(textSetting, true);
			}
		}		
	});
	
	vars.ShouldReset = (Func<dynamic, dynamic, dynamic, dynamic, bool>)((o, c, t, s) => {
		if (vars.fullRun)
		{
			return c.level == 26 && ((o.level == 25 && t.CurrentPhase == TimerPhase.Ended) || (o.level != 25 && o.level != 26)) ;
		}
		
		return o.level != 26 && c.level == 26;
	});
	
	vars.UpdateTextComponents = (Action)(() => {
		vars.SetTextComponent("Completion Rate", vars.currentCompletionRate);
		vars.SetTextComponent("Notes Progress", vars.noteCompletion);
		vars.SetTextComponent("Hats Progress", vars.hatCompletion);
		vars.SetTextComponent("Arts Progress", vars.artCompletion);
		vars.SetTextComponent("Fail Count", vars.failCount.ToString());
		
		var isMasochist = timer.Run.GetExtendedCategoryName(false, false, true).Contains("Masochist");
		vars.SetTextComponentColor("Fail Count", isMasochist && vars.failCount > 0 ? System.Drawing.Color.Red : System.Drawing.Color.White);
	});	
	
	vars.currentCompletionRate = vars.CompletionStringFunc(0, 38, true);
	vars.noteCompletion = vars.CompletionStringFunc(0, 15, false);
	vars.hatCompletion = vars.CompletionStringFunc(0, vars.oybRun ? 2 : 8, false);
	vars.artCompletion = vars.CompletionStringFunc(0, 15, false);
	vars.failCount = 0;
	
	vars.UpdateTextComponents();
}

init {
	vars.UpdateProgressAction(current);
	
	vars.currentCompletionRate = vars.CompletionStringFunc(0, 38, true);
	vars.noteCompletion = vars.CompletionStringFunc(0, 15, false);
	vars.hatCompletion = vars.CompletionStringFunc(0, vars.oybRun ? 2 : 8, false);
	vars.artCompletion = vars.CompletionStringFunc(0, 15, false);
	
	vars.UpdateTextComponents();
}

split {
	var isLastSplit = timer.CurrentSplitIndex == timer.Run.Count - 1;
	
	// on full run and last split, split only if everything is collected
	if (vars.fullRun && isLastSplit)
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
		if (((vars.fullRun && vars.allCollected) || !vars.fullRun) && current.level == 25)
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
	return vars.ShouldReset(old, current, timer, settings);	
}

isLoading {
	return current.isLoading;
}

update {
	if (vars.ShouldReset(old, current, timer, settings))
		vars.timerModel.Reset();
	
	vars.UpdateProgressAction(current);
	
	int totalItems = vars.collection.Count + 1;
	
	float itemsCollected = (vars.collection as List<bool>).Count(x => x) + (current.RN061 ? 0.5f : 0) + (current.RN062 ? 0.5f : 0);
	
	float notesCollected = (vars.notes as List<bool>).Count(x => x);
	if (current.RN061) notesCollected += 0.5f;
	if (current.RN062) notesCollected += 0.5f;
	
	int totalNotes = vars.notes.Count + 1;
	
	vars.allCollected = vars.oybRun ? (vars.oybHats as List<bool>).All(x => x) : totalItems == (int) Math.Round(itemsCollected);

	int hatsCollected = vars.oybRun ? (vars.oybHats as List<bool>).Count(x => x) : (vars.hats as List<bool>).Count(x => x);
	int hatsTotal = vars.oybRun ? vars.oybHats.Count : vars.hats.Count;
	
	vars.currentCompletionRate = vars.CompletionStringFunc(itemsCollected, totalItems, true);
	vars.noteCompletion = vars.CompletionStringFunc(notesCollected, totalNotes, false);
	vars.hatCompletion = vars.CompletionStringFunc(hatsCollected, hatsTotal, false);
	vars.artCompletion = vars.CompletionStringFunc((vars.arts as List<bool>).Count(x => x), vars.arts.Count, false);
	vars.failCount = current.FailCount;
	
	vars.UpdateTextComponents();
	
}

shutdown {
	vars.currentCompletionRate = vars.CompletionStringFunc(0, 38, true);
	vars.noteCompletion = vars.CompletionStringFunc(0, 15, false);
	vars.hatCompletion = vars.CompletionStringFunc(0, 8, false);
	vars.artCompletion = vars.CompletionStringFunc(0, 15, false);
	vars.failCount = 0;
	
	vars.UpdateTextComponents();
}