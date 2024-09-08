package _354
{
   import _1404._1407;
   import _51._50;
   import _51._71;
   import _555.LibraryPanelController;
   import _93._92;
   
   public class _10252 extends _92
   {
      public function _10252()
      {
         super();
         _2215 = true;
         _2219 = true;
      }
      
      override public function _1572(param1:*) : void
      {
         super._1572(param1);
      }
      
      override public function execute() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         super.execute();
         _loc1_ = 0;
         _loc2_ = int(this._10296.length);
         while(_loc1_ < _loc2_)
         {
            if(this._10292._2129(this._10296[_loc1_].name))
            {
               this._10292._2124(this._10296[_loc1_].name);
               this._10292._2128(this._10296[_loc1_]);
               this._2861.replaceArmatureVO(this._10296[_loc1_],this._10294[_loc1_]);
            }
            else
            {
               this._10292._2128(this._10296[_loc1_]);
               this._2861._2867(this._10296[_loc1_],this._10294[_loc1_]);
            }
            _loc1_++;
         }
         if(this._10296.length == 1)
         {
            this._2861._4417(this._10296[0]);
         }
      }
      
      override public function revert() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         super.revert();
         _loc1_ = 0;
         _loc2_ = int(this._10297.length);
         while(_loc1_ < _loc2_)
         {
            this._10292._2125(this._10297[_loc1_]);
            this._2861._2863(this._10297[_loc1_].name);
            _loc1_++;
         }
         _loc1_ = 0;
         _loc2_ = int(this._10299.length);
         while(_loc1_ < _loc2_)
         {
            this._10292._2124(this._10299[_loc1_].name);
            this._10292._2128(this._10299[_loc1_]);
            this._2861.replaceArmatureVO(this._10299[_loc1_],this._10298[_loc1_]);
            _loc1_++;
         }
         this._2861.selectCurArmature();
      }
      
      private function get _10299() : Vector.<_50>
      {
         return _2223._10299 as Vector.<_50>;
      }
      
      private function get _10298() : Vector.<String>
      {
         return _2223._10298 as Vector.<String>;
      }
      
      private function get _10297() : Vector.<_50>
      {
         return _2223._10297 as Vector.<_50>;
      }
      
      private function get _10296() : Vector.<_50>
      {
         return _2223._10296 as Vector.<_50>;
      }
      
      private function get _10294() : Vector.<String>
      {
         return _2223._10294 as Vector.<String>;
      }
      
      private function get _10292() : _71
      {
         return _2223.dragonBonesVO as _71;
      }
      
      private function get _2861() : LibraryPanelController
      {
         return _1407.getInstance(LibraryPanelController) as LibraryPanelController;
      }
   }
}

