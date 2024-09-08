package _639
{
   import _11111._11110;
   import _764._11508;
   import _93._95;
   import egret.utils.FileUtil;
   import flash.filesystem.File;
   import flash.ui.Keyboard;
   
   public class HotkeysModel extends _95
   {
      private static var instance:HotkeysModel;
      
      public static const keyboardNameMap:Object = {};
      
      public static const keyboardCodeMap:Object = {
         "ctrl":Keyboard.CONTROL,
         "cmd":Keyboard.COMMAND,
         "shift":Keyboard.SHIFT,
         "alt":Keyboard.ALTERNATE,
         "esc":Keyboard.ESCAPE,
         "`":Keyboard.BACKQUOTE,
         "tab":Keyboard.TAB,
         "backspace":Keyboard.BACKSPACE,
         "enter":Keyboard.ENTER,
         "space":Keyboard.SPACE,
         "up":Keyboard.UP,
         "down":Keyboard.DOWN,
         "left":Keyboard.LEFT,
         "right":Keyboard.RIGHT,
         "[":Keyboard.LEFTBRACKET,
         "]":Keyboard.RIGHTBRACKET,
         ";":Keyboard.SEMICOLON,
         "\'":Keyboard.QUOTE,
         ",":Keyboard.COMMA,
         ".":Keyboard.PERIOD,
         "/":Keyboard.SLASH,
         "1":Keyboard.NUMBER_1,
         "2":Keyboard.NUMBER_2,
         "3":Keyboard.NUMBER_3,
         "4":Keyboard.NUMBER_4,
         "5":Keyboard.NUMBER_5,
         "6":Keyboard.NUMBER_6,
         "7":Keyboard.NUMBER_7,
         "8":Keyboard.NUMBER_8,
         "9":Keyboard.NUMBER_9,
         "0":Keyboard.NUMBER_0,
         "=":Keyboard.EQUAL,
         "-":Keyboard.MINUS,
         "a":Keyboard.A,
         "b":Keyboard.B,
         "c":Keyboard.C,
         "d":Keyboard.D,
         "e":Keyboard.E,
         "f":Keyboard.F,
         "g":Keyboard.G,
         "h":Keyboard.H,
         "i":Keyboard.I,
         "j":Keyboard.J,
         "k":Keyboard.K,
         "l":Keyboard.L,
         "m":Keyboard.M,
         "n":Keyboard.N,
         "o":Keyboard.O,
         "p":Keyboard.P,
         "q":Keyboard.Q,
         "r":Keyboard.R,
         "s":Keyboard.S,
         "t":Keyboard.T,
         "u":Keyboard.U,
         "v":Keyboard.V,
         "w":Keyboard.W,
         "x":Keyboard.X,
         "y":Keyboard.Y,
         "z":Keyboard.Z,
         "f1":Keyboard.F1,
         "f2":Keyboard.F2,
         "f3":Keyboard.F3,
         "f4":Keyboard.F4,
         "f5":Keyboard.F5,
         "f6":Keyboard.F6,
         "f7":Keyboard.F7,
         "f8":Keyboard.F8,
         "f9":Keyboard.F9,
         "f10":Keyboard.F10,
         "f11":Keyboard.F11,
         "f12":Keyboard.F12,
         "insert":Keyboard.INSERT,
         "delete":Keyboard.DELETE,
         "home":Keyboard.HOME,
         "end":Keyboard.END,
         "pageup":Keyboard.PAGE_UP,
         "pagedown":Keyboard.PAGE_DOWN,
         "numpad_0":Keyboard.NUMPAD_0,
         "numpad_1":Keyboard.NUMPAD_1,
         "numpad_2":Keyboard.NUMPAD_2,
         "numpad_3":Keyboard.NUMPAD_3,
         "numpad_4":Keyboard.NUMPAD_4,
         "numpad_5":Keyboard.NUMPAD_5,
         "numpad_6":Keyboard.NUMPAD_6,
         "numpad_7":Keyboard.NUMPAD_7,
         "numpad_8":Keyboard.NUMPAD_8,
         "numpad_9":Keyboard.NUMPAD_9,
         "numpad_.":Keyboard.NUMPAD_DECIMAL,
         "numpad_add":Keyboard.NUMPAD_ADD,
         "numpad_-":Keyboard.NUMPAD_SUBTRACT,
         "numpad_*":Keyboard.NUMPAD_MULTIPLY,
         "numpad_/":Keyboard.NUMPAD_DIVIDE,
         "numpad_enter":Keyboard.NUMPAD_ENTER
      };
      
      public var _5635:Object;
      
      private var _11728:Object;
      
      private var _5633:String;
      
      private var _5627:String;
      
      private var _5636:Boolean = false;
      
      public function HotkeysModel()
      {
         var _loc1_:String = null;
         var _loc3_:uint = 0;
         var _loc4_:String = null;
         super();
         this._5633 = "hotkeys.txt";
         this._5627 = "hotkeysDebug.txt";
         var _loc2_:RegExp = /./;
         for(_loc4_ in keyboardCodeMap)
         {
            _loc3_ = uint(keyboardCodeMap[_loc4_]);
            _loc1_ = _loc4_.substr(0,1).toUpperCase();
            _loc4_ = _loc4_.replace(_loc2_,_loc1_);
            keyboardNameMap[_loc3_] = _loc4_;
         }
      }
      
      public static function getInstance() : HotkeysModel
      {
         if(instance == null)
         {
            instance = new HotkeysModel();
         }
         return instance;
      }
      
      public function initialize() : void
      {
         var _loc1_:String = null;
         var _loc2_:File = null;
         if(!this._5635)
         {
            _loc2_ = File.applicationStorageDirectory.resolvePath(this._5633);
            if(_loc2_.exists)
            {
               _loc1_ = FileUtil.openAsString(_loc2_.nativePath);
            }
            else
            {
               _loc1_ = _11508.generate();
               this.directlySaveFile(_loc1_);
            }
            this._5635 = this._1664(_loc1_);
            this._12969();
         }
      }
      
      private function _12969() : void
      {
         var _loc3_:String = null;
         var _loc1_:String = _11508.generate();
         var _loc2_:Object = this._1664(_loc1_);
         for(_loc3_ in _loc2_)
         {
            if(this._5635[_loc3_] == null)
            {
               this._5635[_loc3_] = _loc2_[_loc3_];
            }
         }
      }
      
      private function _11725(param1:String, param2:Array) : Array
      {
         if(!param2)
         {
            param2 = [];
         }
         var _loc3_:RegExp = /\t/g;
         param1 = param1.replace(_loc3_,"");
         _loc3_ = /([ 　]{1})/g;
         param1 = param1.replace(_loc3_,"");
         _loc3_ = /\r/g;
         param1 = param1.replace(_loc3_,"");
         return param1.split("\n");
      }
      
      private function _1664(param1:String) : Object
      {
         var _loc2_:Array = null;
         var _loc6_:String = null;
         var _loc7_:Array = null;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:String = null;
         var _loc11_:Object = null;
         var _loc12_:Array = null;
         _loc2_ = this._11725(param1,_loc2_);
         var _loc3_:Object = {};
         var _loc4_:Array = [];
         var _loc5_:Array = [];
         for each(_loc6_ in _loc2_)
         {
            _loc5_ = _loc6_.split(":");
            if(_loc5_.length == 2)
            {
               _loc5_[1] = String(_loc5_[1]).toLowerCase();
               _loc7_ = String(_loc5_[1]).split("+");
               _loc8_ = 0;
               _loc9_ = int(_loc7_.length);
               while(_loc8_ < _loc9_)
               {
                  _loc10_ = _loc7_[_loc8_];
                  _loc11_ = keyboardCodeMap[_loc10_];
                  if(!_loc11_)
                  {
                     break;
                  }
                  _loc7_[_loc8_] = _loc11_;
                  _loc8_++;
               }
               if(_loc8_ == _loc9_)
               {
                  if(!_loc3_[_loc5_[0]])
                  {
                     _loc3_[_loc5_[0]] = _loc7_;
                  }
                  else
                  {
                     _loc12_ = _loc3_[_loc5_[0]];
                     if(_loc12_[0] is Array)
                     {
                        _loc12_.push(_loc7_);
                     }
                     else
                     {
                        _loc3_[_loc5_[0]] = [_loc12_,_loc7_];
                     }
                  }
               }
            }
         }
         return _loc3_;
      }
      
      public function _11726(param1:String) : String
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc2_:* = "";
         var _loc3_:Array = this._5635[param1];
         if(Boolean(_loc3_) && _loc3_.length > 0)
         {
            _loc2_ += "(";
            if(_loc3_[0] is Array)
            {
               _loc2_ += this._11724(_loc3_[0]);
               _loc4_ = 1;
               _loc5_ = int(_loc3_.length);
               while(_loc4_ < _loc5_)
               {
                  _loc2_ = _loc2_ + "|" + this._11724(_loc3_[_loc4_]);
                  _loc4_++;
               }
            }
            else
            {
               _loc2_ += this._11724(_loc3_);
            }
            _loc2_ += ")";
         }
         return _loc2_;
      }
      
      public function _14264(param1:String) : String
      {
         var _loc2_:String = this._11726(param1);
         var _loc3_:RegExp = /[\(\)]/g;
         return _loc2_.replace(_loc3_,"");
      }
      
      private function _11724(param1:Array) : String
      {
         var _loc2_:Array = param1.concat();
         _loc2_.sort(this._11727);
         var _loc3_:String = keyboardNameMap[_loc2_[0]];
         var _loc4_:int = 1;
         var _loc5_:int = int(_loc2_.length);
         while(_loc4_ < _loc5_)
         {
            _loc3_ = _loc3_ + "+" + keyboardNameMap[_loc2_[_loc4_]];
            _loc4_++;
         }
         return _loc3_;
      }
      
      private function _11727(param1:uint, param2:uint) : int
      {
         var _loc3_:int = this._11729(param1);
         var _loc4_:int = this._11729(param2);
         return _loc3_ - _loc4_;
      }
      
      private function _11729(param1:uint) : int
      {
         if(param1 == Keyboard.CONTROL)
         {
            return -4;
         }
         if(param1 == Keyboard.COMMAND)
         {
            return -3;
         }
         if(param1 == Keyboard.SHIFT)
         {
            return -2;
         }
         if(param1 == Keyboard.ALTERNATE)
         {
            return -1;
         }
         return param1;
      }
      
      public function directlySaveFile(param1:String) : void
      {
         var _loc2_:File = this._11730();
         if(!FileUtil.save(_loc2_.nativePath,param1))
         {
            _11110.instance._11204._11132("HotkeysModel::directlySaveFile");
         }
      }
      
      public function _11705() : void
      {
         var _loc1_:String = _11508.generate();
         this.directlySaveFile(_loc1_);
      }
      
      public function deleteCacheFile() : void
      {
         var cacheFile:File = this._11730();
         try
         {
            cacheFile.moveToTrash();
         }
         catch(e:Error)
         {
            _11110.instance._11204._11132("HotkeysModel::deleteCacheFile",e);
         }
      }
      
      private function _11730() : File
      {
         return File.applicationStorageDirectory.resolvePath(this._5633);
      }
   }
}

