/**
*
*  SectionManager.swift
*  RunIt
*
*  Created by Emilian Scheel on 09.02.21
*
*/











import Foundation

class GroupSections {
	
	static func group(runs: [Run], by component: Calendar.Component) -> [Object] {

		var groupedRuns: [Object] = [Object]()
		
		// Für jeden Lauf in ‘runs‘ gehe den Algorythmus durch
		// Nehme dabei jeweils auch den ‘index‘
		for (index, run) in runs.enumerated() {
			
			
			
			// Lade den Kalender und setze deren Zeitzone auf diese
			var calendar = NSCalendar.current
			calendar.timeZone = NSTimeZone(forSecondsFromGMT: 0) as TimeZone
			
			// Für jeden Lauf in ‘groupedRuns‘:
			// 1. Prüfe, ob der Monat von dem Lauf aus ‘runs‘ der gleiche ist, wie der aus dem aktuellen ‘groupedRuns‘-Lauf
			// 2. Prüfe, ob das Jahr von dem Lauf aus ‘runs‘ der gleiche ist, wie der aus dem aktuellen ‘groupedRuns‘-Lauf
			// 3. Wenn beide Bedingugen erfüllt sind, dann füge den Lauf aus ‘runs‘ zu der Gruppe der ‘groupedRuns‘ hinzu
			// 4. Wenn das hier der letzte ‘groupedRuns‘-Lauf ist und der Lauf aus ‘runs‘ immernoch nicht zugeordnet wurde, dann erstelle ein neue Gruppe
			for (index1, groupedRun) in groupedRuns.enumerated() {
							
				let monthSame = calendar.isDate(groupedRun.date, equalTo: run.date!, toGranularity: component)
				
				
				if monthSame {
					groupedRuns[index1].rows.append(ObjectRowRun(run: run, index: index))
					
				} else if !monthSame && index1 == groupedRuns.count-1 {
					groupedRuns.append(Object(date: run.date!, rows: [ObjectRowRun(run: run, index: index)]))
				}
			}
			
			if groupedRuns.count == 0 {
				groupedRuns.append(Object(date: run.date!, rows: [ObjectRowRun(run: run, index: index)]))
			}
		}
		
		return groupedRuns
	}
}







extension GroupSections {
	
	class Object {
		var rows: [ObjectRow]!
		var date: Date
		
		init(date: Date, rows: [ObjectRow]) {
			self.rows = rows
			self.date = date
		}
	}

	class ObjectRow {  }
}