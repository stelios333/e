#include <windows.h>

typedef union _RGBQUAD {
    COLORREF rgb;
    struct {
        BYTE r;
        BYTE g;
        BYTE b;
        BYTE Reserved;
    };
}_RGBQUAD, * PRGBQUAD;

DWORD WINAPI textouts(LPVOID lpvd)
{
    int x = GetSystemMetrics(0); int y = GetSystemMetrics(1);
    LPCSTR text = 0;
    while (1)
    {
        HDC hdc = GetDC(0);
        SetBkMode(hdc, 0);
        text = "You have been hacked!";
        SetTextColor(hdc, RGB(rand() % 255, rand() % 255, rand() % 255));
        HFONT font = CreateFontA(43, 32, 0, 0, FW_THIN, 0, 1, 0, ANSI_CHARSET, 0, 0, 0, 0, "Baby Kruffy");
        SelectObject(hdc, font);
        TextOutA(hdc, rand() % x, rand() % y, text, strlen(text));
        Sleep(100);
        DeleteObject(font);
        ReleaseDC(0, hdc);
    }
}

DWORD WINAPI shader2(LPVOID lpParam) {
    HDC hdcScreen = GetDC(0), hdcMem = CreateCompatibleDC(hdcScreen);
    INT w = GetSystemMetrics(0), h = GetSystemMetrics(1);
    BITMAPINFO bmi = { 0 };
    PRGBQUAD rgbScreen = { 0 };
    bmi.bmiHeader.biSize = sizeof(BITMAPINFO);
    bmi.bmiHeader.biBitCount = 32;
    bmi.bmiHeader.biPlanes = 1;
    bmi.bmiHeader.biWidth = w;
    bmi.bmiHeader.biHeight = h;
    HBITMAP hbmTemp = CreateDIBSection(hdcScreen, &bmi, NULL, (void**)&rgbScreen, NULL, NULL);
    SelectObject(hdcMem, hbmTemp);
    for (;;) {
        hdcScreen = GetDC(0);
        BitBlt(hdcMem, 0, 0, w, h, hdcScreen, 0, 0, SRCCOPY);
        for (INT i = 0; i < w * h; i++) {
            INT x = i % w, y = i / w;
            rgbScreen[i].rgb = (rgbScreen[i].rgb * 2) % (RGB(255, 255, 255));
        }
        BitBlt(hdcScreen, 0, 0, w, h, hdcMem, 0, 10, SRCCOPY);
        BitBlt(hdcScreen, 0, 0, w, h, hdcMem, 0, -h+10, SRCCOPY);
        ReleaseDC(NULL, hdcScreen); DeleteDC(hdcScreen);
    }
}

int main() {
    CreateThread(NULL, 0, shader2, NULL, 0, NULL);
    CreateThread(NULL, 0, textouts, NULL, 0, NULL);
    Sleep(INFINITE); // Keep the program running
    return 0;
}
