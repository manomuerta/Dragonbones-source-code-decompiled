package _724
{
   import _741._744;
   import _741._746;
   import _741._749;
   import egret.utils.FileUtil;
   
   public class _739 implements _730
   {
      public static const CONFIG_FILES:Array = ["json","xml","amf3"];
      
      public function _739()
      {
         super();
      }
      
      private function _5912(param1:_744) : Boolean
      {
         return CONFIG_FILES.indexOf(param1.extension) != -1;
      }
      
      private function _5913(param1:_744, param2:_744) : Boolean
      {
         return true;
      }
      
      public function _5893(param1:Vector.<_746>, param2:Vector.<_725>) : Boolean
      {
         var _loc7_:_744 = null;
         var _loc8_:_749 = null;
         var _loc9_:Boolean = false;
         var _loc10_:String = null;
         var _loc11_:Vector.<_746> = null;
         var _loc12_:_738 = null;
         if(param1 == null || param2 == null)
         {
            return false;
         }
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:Object = {};
         var _loc6_:Vector.<_746> = new Vector.<_746>();
         _loc3_ = 0;
         _loc4_ = int(param1.length);
         while(_loc3_ < _loc4_)
         {
            if(!param1[_loc3_].removed && param1[_loc3_] is _749 && param1[_loc3_].group != _734.GROUP_TEXTURE)
            {
               _loc10_ = FileUtil.getFileName((param1[_loc3_] as _749).fileName);
               _loc5_[_loc10_] = param1[_loc3_];
            }
            _loc3_++;
         }
         _loc3_ = 0;
         _loc4_ = int(param1.length);
         while(_loc3_ < _loc4_)
         {
            if(!param1[_loc3_].removed && param1[_loc3_] is _744 && param1[_loc3_].group == null && this._5912(param1[_loc3_] as _744))
            {
               _loc6_.push(param1[_loc3_]);
            }
            _loc3_++;
         }
         _loc3_ = 0;
         _loc4_ = int(_loc6_.length);
         while(_loc3_ < _loc4_)
         {
            _loc7_ = _loc6_[_loc3_] as _744;
            _loc10_ = FileUtil.getFileName(_loc7_.fileName);
            _loc8_ = _loc5_[_loc10_] as _749;
            if(_loc8_ != null && this._5913(_loc7_,_loc8_))
            {
               _loc11_ = new Vector.<_746>();
               _loc11_.push(_loc7_);
               _loc11_.push(_loc8_);
               _loc12_ = new _738(_loc11_);
               param2.push(_loc12_);
               _loc9_ = true;
            }
            _loc3_++;
         }
         return _loc9_;
      }
      
      public function _5894(param1:Vector.<_725>) : Boolean
      {
         var _loc5_:_738 = null;
         var _loc6_:Boolean = false;
         if(param1 == null)
         {
            return false;
         }
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:Vector.<_738> = new Vector.<_738>();
         _loc2_ = 0;
         _loc3_ = int(param1.length);
         while(_loc2_ < _loc3_)
         {
            if(param1[_loc2_] is _738)
            {
               _loc5_ = param1[_loc2_] as _738;
               if(_loc5_.missing)
               {
                  param1.splice(_loc2_,1);
                  _loc2_--;
                  _loc3_--;
               }
            }
            _loc2_++;
         }
         return _loc6_;
      }
      
      public function get priority() : int
      {
         return _734.PRIORITY_TEXTURE;
      }
   }
}

