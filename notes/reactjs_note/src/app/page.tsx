'use server'

import {redirect} from 'next/navigation'

export default async function ButtonUsage() {
    redirect(`/workspace`) // Navigate to the new post page
}
