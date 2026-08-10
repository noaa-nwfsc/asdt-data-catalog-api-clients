import asyncio

from mcp import ClientSession, StdioServerParameters
from mcp.client.stdio import stdio_client


async def test_tool():
    # 1. Define the command to start your server
    server_params = StdioServerParameters(
        command="clients/python_public/.venv/Scripts/nwfsc-mcp.exe", args=[]
    )

    # 2. Connect to the server via stdio
    async with stdio_client(server_params) as (read, write):
        async with ClientSession(read, write) as session:
            # 3. Perform the mandatory MCP initialization handshake
            await session.initialize()

            print("Calling read_bottom_trawl_tows with limit=10...")

            # 4. Call your tool! (Omitted fields will use their defaults)
            result = await session.call_tool(
                "read_bottom_trawl_tows", arguments={"limit": 10}
            )

            print("Result:")
            print(result)


if __name__ == "__main__":
    asyncio.run(test_tool())
