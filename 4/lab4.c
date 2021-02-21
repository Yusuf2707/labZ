#include <windows.h>
#include "stdio.h"

char exit_flag = 0;

int WINAPI ThreadFunc(LPVOID param) {
	HWND handle = 0;
	while (NULL == handle) {
		handle = FindWindowA(NULL, "64-bit hello!");
	}

	RECT r;
	GetWindowRect(handle, &r);

	while (!exit_flag) {
		MoveWindow(handle, rand() % 1000, rand() % 1000, 150, 150, TRUE);
		Sleep(3000);
	}

	return 0;
}

int APIENTRY WinMain(HINSTANCE hInstance, HINSTANCE hPrevInstance, LPSTR lpCmdLine, int nCmdShow) {
	CreateThread(NULL, 0, ThreadFunc, NULL, 0, NULL);
	MessageBoxA(0, "Hello, hell!", "64-bit hello!", MB_OK);
	exit_flag = 1;
	return 0;
}