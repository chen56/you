import type {Metadata} from "next";

import * as React from 'react';

export const metadata: Metadata = {
    title: "Kou App",
    description: "make app easy",
};

export default function RootLayout({children}: Readonly<{ children: React.ReactNode }>) {
    return (
        <html lang="en">
        <body>
        <main>
            <div className="sticky top-0 navbar bg-blue-950 text-neutral-content">
                <div className="navbar-start">
                    <a className="link link-hover text-xl">Kou</a>
                </div>
                <div className="navbar-end">
                    <a className="link link-hover text-xl" target="_blank" href="https://github.com/chen56/kou">
                        {/* <MdiGithub class="hover:text-red-400" width="32" height="32"/>*/}
                    </a>

                </div>
            </div>

            <div className="flex">
                {/*  --h-dvh 使左边栏占满viewport所有有效高度 */}
                <div className="min-w-48 bg-base-200 h-dvh">
                    <ul className="menu">
                        <li><a href="/workspace">Home</a></li>
                        <li><a href="/workspace/providers">提供器Provider</a></li>
                    </ul>
                </div>
                {/*
                    设置内容区域单独滚动，必须要让内容区域实际高度小于可显示高度：
                    比如:
                    <div style="height:500px;overflow-y: scroll;" class="bg-red-100">
                        <div style="height:1000px;" class="bg-blue-100">很长的内容。。。</div>
                    </div>

                    所以设置下列class：
                    h-dvh 高度viewport最大（y轴必须）
                    overflow-y-scroll y轴滚动（y轴必须）
                    scroll-smooth 平滑滚动（可选）

                    style="overflow-y: unset;height: 600px" "overflow-y: scroll ;"
                */}

                <div className="w-dvw h-dvh  overflow-y-scroll scroll-smooth" style={{overflowY: "scroll"}}>
                    {children}
                </div>
                {/*<span class="flex-none min-w-48    bg-base-200  ">nav right</span>*/}
            </div>
        </main>
        </body>
        </html>
    );
}