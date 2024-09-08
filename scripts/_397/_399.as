package _397
{
   import _1404._1407;
   import _35.HashObject;
   import _51._52;
   import _51._79;
   import _555._571;
   import _703._704;
   import _703._705;
   import _755._759;
   import _755._760;
   import _783.StageNotification;
   import _93._92;
   
   public class _399 extends _92
   {
      public function _399()
      {
         super();
         _2215 = false;
         _2219 = true;
      }
      
      override public function execute() : void
      {
         super.execute();
         this.update(this.value);
      }
      
      override public function revert() : void
      {
         this.update(!this.value);
      }
      
      private function update(param1:Boolean) : void
      {
         var _loc3_:_704 = null;
         if(this._3340 == null)
         {
            return;
         }
         var _loc2_:_759 = this._3340[this.type + "Filter"];
         if(_loc2_ == null)
         {
            return;
         }
         if(this.item is _52 && Boolean(this.item.rootArmatureData))
         {
            _loc2_._3342(this.item.rootArmatureData.id,(this.item as HashObject).id,param1);
            _loc3_ = _705._2944[this.item];
         }
         else if(this.item is _79 && Boolean(this.item.rootArmatureData))
         {
            _loc2_._3343(this.item.rootArmatureData.id,(this.item as HashObject).id,param1);
            _loc3_ = _705._2273[this.item];
         }
         this._2880._1567(new StageNotification(StageNotification.UPDATE_FILTER_STATUS));
         this._2880._2943(_loc3_);
      }
      
      protected function get item() : Object
      {
         return _2223.item;
      }
      
      protected function get type() : String
      {
         return _2223.type;
      }
      
      protected function get value() : Boolean
      {
         return _2223.value;
      }
      
      protected function get _2880() : _571
      {
         return _1407.getInstance(_571) as _571;
      }
      
      protected function get _3340() : _760
      {
         return this._2880._2871._3286;
      }
   }
}

