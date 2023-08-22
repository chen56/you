/** @jsxImportSource react */
import { qwikify$ } from '@builder.io/qwik-react';
import List from '@mui/joy/List';
import ListItem from '@mui/joy/ListItem';
import Button from '@mui/joy/Button';
import { Link, ListItemButton, Sheet } from '@mui/joy';


function ButtonUsage() {
  return <Button variant="solid">Hello world</Button>;
}
export const QButtonUsage = qwikify$(ButtonUsage);

function Nav() {
  return <Sheet  variant="soft" sx={{ color:"neutral" }} >
    <List variant="plain" size='sm' sx={{ minWidth: 200, height: '200%' }}>
      <ListItem><ListItemButton><Link href="/music">music</Link></ListItemButton></ListItem>
      <ListItem><ListItemButton><Link href="/music/cool_music">超酷曲目</Link></ListItemButton></ListItem>
      <ListItem><ListItemButton><Link href="/web_audio_api">web audio api</Link></ListItemButton></ListItem>
      <ListItem><ListItemButton><Link href="/react">mui</Link></ListItemButton></ListItem>
    </List>
  </Sheet>

    ;
}


export const QNav = qwikify$(Nav);
