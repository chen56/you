/** @jsxImportSource react */
import { qwikify$ } from '@builder.io/qwik-react';

import * as React from "react";
import AppBar from "@mui/material/AppBar";
import Box from "@mui/material/Box";
import CssBaseline from "@mui/material/CssBaseline";
import Divider from "@mui/material/Divider";
import Drawer from "@mui/material/Drawer";
import IconButton from "@mui/material/IconButton";
import InboxIcon from "@mui/icons-material/MoveToInbox";
import List from "@mui/material/List";
import ListItem from "@mui/material/ListItem";
import ListItemButton from "@mui/material/ListItemButton";
import ListItemIcon from "@mui/material/ListItemIcon";
import ListItemText from "@mui/material/ListItemText";
import MailIcon from "@mui/icons-material/Mail";
import MenuIcon from "@mui/icons-material/Menu";
import Toolbar from "@mui/material/Toolbar";
import Typography from "@mui/material/Typography";

import Button from '@mui/joy/Button';

 function ButtonUsage() {
  return <Button variant="solid">Hello world</Button>;
}

interface Props {
  /**
   * Injected by the documentation to work in an iframe.
   * You won't need it on your project.
   */
  window?: () => Window;
}

// Create React component standard way
function Greetings(props: Props) {
  return <p>Hello from React</p>;
}


function ResponsiveDrawer(props: Props) {
  const { window } = props;
  const [mobileOpen, setMobileOpen] = React.useState(false);

  const handleDrawerToggle = () => {
    setMobileOpen(!mobileOpen);
  };

  const drawer = (
    <div>
      <List sx={{border:1}}>
        {["Inbox", "Starred", "Send email", "Drafts"].map((text, index) => (
          <ListItem key={text} disablePadding>
            <ListItemButton><ListItemIcon><InboxIcon /></ListItemIcon><ListItemText primary={text} /></ListItemButton>
          </ListItem>
        ))}
      </List>
      <Divider />
    </div>
  );
  return <>{drawer}</>;
}

// Convert React component to Qwik component
export const QGreetings = qwikify$(Greetings);
export const QResponsiveDrawer = qwikify$(ResponsiveDrawer);
export const QButtonUsage = qwikify$(ButtonUsage);

