package appointment

import (
	"covid_vaccination/pkg/client"
	"time"
)

type appointment struct {
	Center string
	client client.Client
	Time   time.Time
}

type Repository interface {
	GetAppointments(center string) []appointment
	GetAllAppointments() []appointment
	CreateAppointment(appointment appointment) error
}

func New() *appointment {
	return &appointment{}
}
