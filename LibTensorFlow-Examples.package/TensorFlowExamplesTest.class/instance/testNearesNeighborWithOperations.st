testing-NearesNeighbor
testNearesNeighborWithOperations
	| plan |
	plan := ExampleNearestNeighborPlan new initializeGraphWithOperations initializeSession.
	self testNearesNeighbor: plan.