package _24
{
   import _1404._1420;
   import _859.LibraryPanel;
   import _929.ScenePanel;
   import _97._14036;
   import _978.TimelinePanel;
   import egret.utils.SystemInfo;
   import flash.desktop.NativeApplication;
   import flash.display.InteractiveObject;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.ui.Keyboard;
   import flash.utils.Dictionary;
   
   public class Shortcut
   {
      private static var instance:Shortcut;
      
      private var _1686:Dictionary;
      
      private var _1684:Dictionary;
      
      private var _15568:Array;
      
      private var _1680:Dictionary;
      
      public function Shortcut(param1:Stage)
      {
         this._1686 = new Dictionary(true);
         this._1684 = new Dictionary();
         this._15568 = [_26.RENAME,_26.DUPLICATE,_26.COPY,_26.PASTE];
         this._1680 = new Dictionary();
         super();
         param1.addEventListener(KeyboardEvent.KEY_DOWN,this._1674,true,2000);
         param1.addEventListener(KeyboardEvent.KEY_UP,this._1678,true,2000);
         NativeApplication.nativeApplication.addEventListener(Event.ACTIVATE,this._12506);
      }
      
      public static function initialize(param1:Stage) : void
      {
         if(instance)
         {
            return;
         }
         instance = new Shortcut(param1);
      }
      
      public static function _1681(param1:InteractiveObject, param2:String, param3:Function) : void
      {
         if(instance)
         {
            instance._1681(param1,param2,param3);
         }
      }
      
      public static function _1673(param1:InteractiveObject, param2:String, param3:Function) : void
      {
         instance._1673(param1,param2,param3);
      }
      
      public static function _1669(param1:InteractiveObject) : void
      {
         var _loc2_:Array = null;
         var _loc3_:ShortcutMap = null;
         if(instance._1686[param1])
         {
            _loc2_ = instance._1686[param1];
            for each(_loc3_ in _loc2_)
            {
               instance._1673(param1,_loc3_.type,_loc3_.callBack);
            }
         }
      }
      
      public static function _1682(param1:String, param2:Array) : void
      {
         instance._1682(param1,param2);
      }
      
      public static function _1672(param1:Object) : void
      {
         var _loc2_:String = null;
         for(_loc2_ in param1)
         {
            instance._1682(_loc2_,param1[_loc2_]);
         }
      }
      
      public static function _1676(param1:String) : void
      {
         instance._1676(param1);
      }
      
      public static function _1671() : void
      {
         instance._1684 = new Dictionary();
      }
      
      public static function _1685(param1:uint) : Boolean
      {
         return instance._1685(param1);
      }
      
      public static function _1677() : Boolean
      {
         return instance._1685(SystemInfo.isMacOS ? Keyboard.COMMAND : Keyboard.CONTROL);
      }
      
      public static function clear() : void
      {
         instance.clear();
      }
      
      public function _1681(param1:InteractiveObject, param2:String, param3:Function) : void
      {
         if(this._1670(param1,param2,param3) >= 0)
         {
            return;
         }
         if(this._1686[param1] === undefined)
         {
            this._1686[param1] = [];
            param1.addEventListener(KeyboardEvent.KEY_DOWN,this.onKeyDown,false,0,true);
         }
         var _loc4_:ShortcutMap;
         (_loc4_ = new ShortcutMap()).type = param2;
         _loc4_.callBack = param3;
         this._1686[param1].push(_loc4_);
      }
      
      public function _1673(param1:InteractiveObject, param2:String, param3:Function) : void
      {
         var _loc5_:Array = null;
         var _loc4_:int = this._1670(param1,param2,param3);
         if(_loc4_ >= 0)
         {
            _loc5_ = this._1686[param1];
            _loc5_.splice(_loc4_,1);
            if(_loc5_.length == 0)
            {
               param1.removeEventListener(KeyboardEvent.KEY_DOWN,this.onKeyDown);
               delete this._1686[param1];
            }
         }
      }
      
      private function _1670(param1:InteractiveObject, param2:String, param3:Function) : int
      {
         var _loc4_:Array = null;
         var _loc5_:ShortcutMap = null;
         var _loc6_:int = 0;
         if(this._1686[param1])
         {
            _loc4_ = this._1686[param1];
            _loc6_ = 0;
            while(_loc6_ < _loc4_.length)
            {
               _loc5_ = _loc4_[_loc6_] as ShortcutMap;
               if(_loc5_.type == param2 && _loc5_.callBack == param3)
               {
                  return _loc6_;
               }
               _loc6_++;
            }
         }
         return -1;
      }
      
      public function _1682(param1:String, param2:Array) : void
      {
         var _loc3_:Array = null;
         if(Boolean(param2) && param2.length > 0)
         {
            if(param2.length > 1)
            {
               if(param2[0] is Array)
               {
                  for each(_loc3_ in param2)
                  {
                     this._11513(_loc3_);
                  }
               }
               else
               {
                  this._11513(param2);
               }
            }
            this._1684[param1] = param2;
         }
      }
      
      private function _11513(param1:Array) : void
      {
         var _loc4_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = int(param1.length);
         while(_loc2_ < _loc3_)
         {
            _loc4_ = int(param1[_loc2_]);
            if(_loc4_ != Keyboard.CONTROL && _loc4_ != Keyboard.COMMAND && _loc4_ != Keyboard.SHIFT && _loc4_ != Keyboard.ALTERNATE)
            {
               param1[_loc2_] = param1[0];
               param1[0] = _loc4_;
            }
            _loc2_++;
         }
      }
      
      public function _1676(param1:String) : void
      {
         if(this._1684[param1])
         {
            delete this._1684[param1];
         }
      }
      
      private function onKeyDown(param1:KeyboardEvent) : void
      {
         var _loc3_:ShortcutMap = null;
         var _loc5_:Array = null;
         var _loc6_:Boolean = false;
         var _loc7_:* = undefined;
         if(param1.target is _1420)
         {
            if(KeyCode._1667(param1.keyCode) == "Tab" && _14036._9587)
            {
               param1.preventDefault();
               _14036._14263(param1.shiftKey ? _14036.PREV : _14036.NEXT);
            }
            return;
         }
         var _loc2_:Array = this._1686[param1.currentTarget];
         if(!_loc2_ || _loc2_.length == 0)
         {
            return;
         }
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_.length)
         {
            _loc3_ = _loc2_[_loc4_] as ShortcutMap;
            _loc5_ = this._1684[_loc3_.type];
            if(!(!_loc5_ || _loc5_.length == 0))
            {
               _loc6_ = false;
               if(_loc5_[0] is Array)
               {
                  for each(_loc7_ in _loc5_)
                  {
                     if(_loc7_ is uint)
                     {
                        _loc6_ = this.check(param1,[_loc7_]);
                     }
                     else
                     {
                        _loc6_ = this.check(param1,_loc7_);
                     }
                     if(_loc6_)
                     {
                        break;
                     }
                  }
               }
               else
               {
                  _loc6_ = this.check(param1,_loc5_);
               }
               if(_loc6_)
               {
                  if(_loc3_.callBack.length == 0)
                  {
                     _loc3_.callBack();
                  }
                  else if(_loc3_.callBack.length == 1)
                  {
                     _loc3_.callBack(_loc3_.type);
                  }
                  else if(_loc3_.callBack.length == 2)
                  {
                     _loc3_.callBack(_loc3_.type,param1);
                  }
                  else
                  {
                     _loc3_.callBack();
                  }
                  this._15569(_loc3_.type,param1);
                  if(_26.BONE_GROUP_MAP.indexOf(_loc3_.type) > -1)
                  {
                     return;
                  }
               }
            }
            _loc4_++;
         }
      }
      
      private function _15569(param1:String, param2:KeyboardEvent) : void
      {
         if(this._15568.indexOf(param1) >= 0 && (param2.currentTarget is ScenePanel || param2.currentTarget is LibraryPanel || param2.currentTarget is TimelinePanel))
         {
            param2.stopPropagation();
         }
      }
      
      private function check(param1:KeyboardEvent, param2:Array) : Boolean
      {
         if(param2 && param2.length > 0 && param1.keyCode == param2[0])
         {
            if((Boolean(param1.controlKey) && param2.indexOf(Keyboard.CONTROL) != -1 || !param1.controlKey && param2.indexOf(Keyboard.CONTROL) == -1) && (Boolean(param1.commandKey) && param2.indexOf(Keyboard.COMMAND) != -1 || !param1.commandKey && param2.indexOf(Keyboard.COMMAND) == -1) && (param1.shiftKey && param2.indexOf(Keyboard.SHIFT) != -1 || !param1.shiftKey && param2.indexOf(Keyboard.SHIFT) == -1) && (param1.altKey && param2.indexOf(Keyboard.ALTERNATE) != -1 || !param1.altKey && param2.indexOf(Keyboard.ALTERNATE) == -1))
            {
               return true;
            }
         }
         return false;
      }
      
      private function _1675(param1:KeyboardEvent) : Array
      {
         var _loc2_:Array = [];
         if(param1.altKey)
         {
            _loc2_.push(Keyboard.ALTERNATE);
         }
         if(param1.shiftKey)
         {
            _loc2_.push(Keyboard.SHIFT);
         }
         if(param1.controlKey)
         {
            _loc2_.push(Keyboard.CONTROL);
         }
         if(param1.commandKey)
         {
            _loc2_.push(Keyboard.COMMAND);
         }
         return _loc2_;
      }
      
      private function _12506(param1:Event) : void
      {
         this._1680 = new Dictionary();
      }
      
      private function _1674(param1:KeyboardEvent) : void
      {
         this._1680[uint(param1.keyCode)] = true;
      }
      
      private function _1678(param1:KeyboardEvent) : void
      {
         var _loc2_:uint = param1.keyCode;
         if(this._1680[_loc2_])
         {
            delete this._1680[_loc2_];
         }
      }
      
      public function _1685(param1:uint) : Boolean
      {
         return Boolean(this._1680[param1]);
      }
      
      public function clear() : void
      {
         this._1680 = new Dictionary();
      }
   }
}

class ShortcutMap
{
   public var type:String;
   
   public var callBack:Function;
   
   public function ShortcutMap()
   {
      super();
   }
}

