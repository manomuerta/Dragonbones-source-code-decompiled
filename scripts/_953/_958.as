package _953
{
   import _1038._1037;
   import _127._131;
   import _51._79;
   import _948._951;
   import _97._103;
   import flash.events.Event;
   
   public class _958 extends _131
   {
      protected var _6092:_79;
      
      protected var _6090:_951;
      
      public function _958()
      {
         super();
         mouseEnabled = false;
         _3854 = true;
         itemRenderer = _951;
      }
      
      public function dispose() : void
      {
      }
      
      public function _2907(param1:_79) : void
      {
         _103.addItem(param1);
         dataProvider._4016(param1);
      }
      
      public function get _5021() : _79
      {
         return this._6092 as _79;
      }
      
      public function set _5021(param1:_79) : void
      {
         if(this._6092 == param1)
         {
            return;
         }
         this._6092 = param1;
         var _loc2_:_951 = !!param1 ? _2474(this._6092) as _951 : null;
         if(this._6090 == _loc2_)
         {
            return;
         }
         if(Boolean(this._6090) && Boolean(this._6090.owner))
         {
            this._6090._4901 = false;
         }
         this._6090 = _loc2_;
         if(this._6090)
         {
            this._6090._4901 = true;
         }
         dispatchEvent(new Event("rolloveredItemChanged"));
      }
      
      public function get _6091() : _1037
      {
         return dataProvider as _1037;
      }
   }
}

