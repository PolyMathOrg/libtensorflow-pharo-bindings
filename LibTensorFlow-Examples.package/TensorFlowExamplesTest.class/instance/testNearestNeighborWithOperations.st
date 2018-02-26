testing-NearesNeighbor
testNearestNeighborWithOperations
	| plan |
	plan := ExampleNearestNeighborPlan new initializeGraphWithOperations initializeSession.
	self testNearestNeighbor: plan