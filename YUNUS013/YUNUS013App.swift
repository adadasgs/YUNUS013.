import SwiftUI

@main
struct YUNUS013App: App {
    var body: some Scene { WindowGroup { GateView() } }
}

struct GateView: View {
    @State private var password = ""
    @State private var unlocked = false
    var body: some View {
        ZStack {
            Color(red: 0.025, green: 0.04, blue: 0.075).ignoresSafeArea()
            if unlocked { PanelView() }
            else {
                VStack(spacing: 22) {
                    Text("YUNUS013").font(.system(size: 34, weight: .black, design: .rounded)).foregroundStyle(.cyan)
                    Text("ACCESS CONTROL").font(.caption.bold()).tracking(3).foregroundStyle(.white.opacity(0.55))
                    SecureField("Пароль", text: $password).textContentType(.password).padding()
                        .background(.white.opacity(0.08), in: RoundedRectangle(cornerRadius: 14))
                    Button("ВОЙТИ") { if password == "013" { unlocked = true } }
                        .font(.headline).foregroundStyle(.black).frame(maxWidth: .infinity).padding()
                        .background(.cyan, in: RoundedRectangle(cornerRadius: 14))
                }.padding(28).frame(maxWidth: 420)
            }
        }.preferredColorScheme(.dark)
    }
}

struct PanelView: View {
    @State private var tab = "AIM"
    @State private var showHead = true
    @State private var demoToggle = false
    @State private var fov: Double = 120
    private let tabs = ["AIM", "VISUAL", "WALL", "OTHER"]
    var body: some View {
        VStack(spacing: 16) {
            HStack {
                Text("YUNUS013").font(.title2.bold()).foregroundStyle(.cyan)
                Spacer()
                Button("Выйти") { tab = "OTHER" }.foregroundStyle(.white)
            }
            HStack(spacing: 8) {
                ForEach(tabs, id: \.self) { item in
                    Button(item) { tab = item }.font(.caption.bold()).padding(10).frame(maxWidth: .infinity)
                        .background(tab == item ? Color.cyan.opacity(0.25) : Color.white.opacity(0.06), in: RoundedRectangle(cornerRadius: 10))
                        .foregroundStyle(tab == item ? .cyan : .white.opacity(0.7))
                }
            }
            ScrollView {
                VStack(alignment: .leading, spacing: 14) {
                    if tab == "AIM" {
                        Toggle("Демонстрационная настройка", isOn: $demoToggle)
                        VStack(alignment: .leading) { Text("FOV: \(Int(fov))"); Slider(value: $fov, in: 30...360) }
                    } else if tab == "VISUAL" {
                        Toggle("Голова Скибиди (внутри приложения)", isOn: $showHead)
                    } else if tab == "WALL" {
                        Text("Демонстрационный раздел. Данных Oxide приложение не получает.")
                    } else {
                        Text("YUNUS013 • UI prototype")
                        Text("iOS не разрешает обычному приложению рисовать произвольные элементы поверх Oxide.")
                    }
                    Text("Переключатели — только элементы интерфейса, они не изменяют игру.")
                        .font(.footnote).foregroundStyle(.white.opacity(0.45))
                }.padding().background(.white.opacity(0.06), in: RoundedRectangle(cornerRadius: 16))
            }
            if showHead { HStack { Spacer(); Text("🚽").font(.system(size: 30)).padding(12).background(.cyan.opacity(0.18), in: Circle()) } }
        }.padding().background(Color(red: 0.025, green: 0.04, blue: 0.075)).preferredColorScheme(.dark)
    }
}