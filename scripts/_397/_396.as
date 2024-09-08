package _397
{
   import _1404._1407;
   import _51._50;
   import _555._571;
   import _573.TimelinePanelController;
   import _755._759;
   import _755._760;
   import _783.StageNotification;
   import _93._92;
   
   public class _396 extends _92
   {
      public function _396()
      {
         super();
         _2215 = true;
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
         var _loc2_:_759 = this._3340[this.type + "Filter"];
         _loc2_._3337(this.armature,param1);
         this._2880._1567(new StageNotification(StageNotification.UPDATE_FILTER_STATUS));
         this._2880._3339();
         var _loc3_:int = param1 ? 1 : 2;
         this._2880._3338(this.type,_loc3_);
         var _loc4_:Array = [{
            "type":this.type,
            "value":_loc3_
         }];
         this._3208._3336(_loc4_);
         this._3208._3338(this.type,_loc3_);
      }
      
      protected function get armature() : _50
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
      
      protected function get _3208() : TimelinePanelController
      {
         return _1407.getInstance(TimelinePanelController) as TimelinePanelController;
      }
   }
}

