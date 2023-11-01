import SwiftUI

struct TripDetailView: View {
    @ObservedObject var presenter: TripDetailPresenter

    var body: some View {
        VStack {
            TextField("Trip Name", text: presenter.setTripName)
                .textFieldStyle(.roundedBorder)
                .padding([.horizontal])
        }
        .navigationTitle(Text(presenter.tripName))
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Save") {
                    self.presenter.save()
                }
            }
        }
    }
}

struct TripDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let model = DataModel.sample
        let trip = model.trips[1]
        let mapProvider = RealMapDataProvider()
        let presenter = TripDetailPresenter(interactor:
            TripDetailInteractor(
                trip: trip,
                model: model,
                mapInfoProvider: mapProvider))
        return NavigationView {
            TripDetailView(presenter: presenter)
        }
    }
}
