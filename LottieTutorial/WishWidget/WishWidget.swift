//
//  WishWidget.swift
//  WishWidget
//
//  Created by Nur Efsan Albas on 27.10.2021.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date())
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date())
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .day, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
}

struct WishWidgetEntryView : View {
    var entry: Provider.Entry
    let answers = ["Today your dreams comes true!","Today you are so beautiful!","You will be succesfull!","Smile and the world smiles with you!","Believe in yourself!","Live in the moment!","Time never comes again!", "Everything you can imagine is real!","The best way to predict your future is to create it.","Don’t let idiots ruin your day.","It is time to be happy again.","Patience is a key element of success.","Better days are coming.","Do not let the behaviour of others destroy your inner peace.","Do good for others. It will come back in unexpected ways.","Learn from yesterday, live for today, hope for tomorrow.","Time never comes again.","A smooth sea never made a skilled sailor.","It’s always too early to quit.","If you fell down yesterday, stand up today.","Everything has beauty, but not everyone sees it.","Life is the sum of all your choices.","The best view comes after the hardest climb.","To begin, begin."
    ]
    var body: some View {
        ZStack {
            Image("auora").resizable()
            Text(answers.randomElement() ?? "Love Yourself!").font(.custom("Papyrus", size: 22)).italic().foregroundColor(.white.opacity(10)).multilineTextAlignment(.center)
                .padding()
            
        }
    }
}

@main
struct WishWidget: Widget {
    let kind: String = "WishWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            WishWidgetEntryView(entry: entry)
        }.supportedFamilies([.systemMedium,.systemLarge])
        .configurationDisplayName("WishBall")
        .description("Your Daily Motivation Widget.")
        
    }
}

struct WishWidget_Previews: PreviewProvider {
    static var previews: some View {
        WishWidgetEntryView(entry: SimpleEntry(date: Date()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
