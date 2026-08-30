// Package weather description.
package weather

// CurrentCondition description.
var CurrentCondition string
// CurrentLocation description.
var CurrentLocation string

// Forecast description.
func Forecast(city, condition string) string {
	CurrentLocation, CurrentCondition = city, condition
	return CurrentLocation + " - current weather condition: " + CurrentCondition
}
