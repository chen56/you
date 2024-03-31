import {useState} from "react";
import {Dropdown} from 'primereact/dropdown';

export default function BasicDemo() {
    const [selectedCity, setSelectedCity] = useState(null);
    const cities = [
        {name: 'New York', code: 'NY'},
        {name: 'Rome', code: 'RM'},
        {name: 'London', code: 'LDN'},
        {name: 'Istanbul', code: 'IST'},
        {name: 'Paris', code: 'PRS'}
    ];

    return (
        <div className="card flex justify-content-center">
            <Dropdown value={selectedCity} onChange={(e) => setSelectedCity(e.value)} options={cities} optionLabel="name" placeholder="Select a City" className="w-full "/>
        </div>
    )
}
