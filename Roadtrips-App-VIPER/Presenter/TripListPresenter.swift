import SwiftUI
import Combine

class TripListPresenter: ObservableObject {
    private let router = TripListRouter()
    private let interactor: TripListInteractor
    @Published var trips: [Trip] = []
    private var cancellables = Set<AnyCancellable>()

    init(interactor: TripListInteractor) {
        self.interactor = interactor
        interactor.model.$trips
            .assign(to: \.trips, on: self)
            .store(in: &cancellables)
    }

    func addNewtrip() {
        interactor.addNewtrip()
    }

    func makeAddNewButton() -> some View {
        Button(action: addNewtrip) {
            Image(systemName: "plus")
        }
    }

    func deleteTrip(_ index: IndexSet) {
        interactor.deleteTrip(index)
    }

    func linkBuilder<Content: View>(trip: Trip, @ViewBuilder content: () -> Content) -> some View {
        NavigationLink(destination: router.makeDetailView(for: trip, model: interactor.model)) {
            content()
        }
    }
}
