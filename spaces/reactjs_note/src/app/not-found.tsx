import Link from 'next/link'
import {headers} from 'next/headers'

export default async function NotFound() {
    const headersList = headers()
    const referer = headersList.get('referer')
    return (
        <div>
            <h2>Not Found: {referer}</h2>
            <p>
                return <Link className={"btn"} href="/">Home</Link>
            </p>
        </div>
    )
}